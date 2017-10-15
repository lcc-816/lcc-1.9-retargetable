
/*
** Things to do:
**
** Put in assembly data directives (dc i0, good stuff)
** Optimize using side-swapping constant search
*/

/* C compiler: symbolic code generator */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define NOCLIB

#include "c.h"

#define SWAP_OK 1
#define SWAP_NOT_OK 0

/* func prototypes */

static int frame_offset, local_stack_frame;		/* current frame offset */
static int argument_space;
static Node *tail;

/* Hack start */

#define MAX_TEMPS 256

int temps[MAX_TEMPS];

static int pass1_flag;
static int deep_stack_flag;
static int temps_used;

static int current_segment = CODE;
static int inside_segment = 0;

static char filename[32];
static int data_segment_num = 0;

static int nasty_kludge_flag;
Symbol ret_struct;

/* Hack end */

dclproto(extern char *asmname,(Symbol));
dclproto(extern unsigned regloc,(Symbol));
dclproto(extern int regoffset,(int, int));

dclproto(static int gen1,(Node, int, int));
dclproto(static void symname,(Symbol));

/* address - initialize q for addressing expression p+n */
void address(q, p, n) Symbol q, p; int n; {

	q->x.name = stringf("%s%s%d", p->x.name, n > 0 ? "+" : "", n);
}

/* asmcode - emit assembly language specified by asm */

void asmcode(char *str, Symbol argv[])

{
	outs("!");

	for ( ; *str; str++)
		if ((*str == '%') && (str[1] >= 0) && (str[1] <= 9))
			print("%s", asmname(argv[*++str]));
		else
			*bp++ = *str;

	outs("\n");
}

/* asmname - print assembler code for symbol p */
char *asmname(p) Symbol p; {
	return p->x.name;
}

/* defconst - define a constant */
void defconst(int ty, Value v)

{
	switch (ty) {

	case C:
		print("!\tdc\ti1'%d'\n", v.uc);
		break;

	case S:
		print("!\tdc\ti2'%d'\n", v.ss);
		break;

	case I:
		print("!\tdc\ti4'%d'\n", v.i);
		break;

	case U:
		print("!\tdc\ti4'%d'\n", v.u);
		break;

	case P:
		print("!\tdc\ti4'$%x'\n", v.p);
		break;

	case F:
		print("!\tdc\ti4'$%x'\n", v.u);
		break;

	case D:
		print("!\tdc\ti4'$%x,$%x'\n", v.i, *(&v.i + 1));
		break;

	default:
		print("unknown constant type: %c\n", ty);
		assert(0);
	}
}

void defstring(int len, char *s)
{

	int i, count = 0;

	for (i=0; i<len; i++) {

		if (!count) {
			print("!\tdc\ti1\'%d", *s++ & 0x0ff);
		} else if (count == 15) {
			print(",%d\'\n", *s++ & 0x0ff);
			count = -1;
		} else {
			print(",%d", *s++ & 0x0ff);
		}

		count++;
	}
	print("\'\n");
}

/*
** void defsymbol(Symbol p)
**
** This function mostly initializes the Xsymbol.
*/

void defsymbol(Symbol p)
{
	print("* defsymbol: %s\n", p->name);

	if (p->scope == CONSTANTS) {

		/* ugly hack because Watcom's atoi/atol doesn't handle hex? */

		if (!strncmp(p->name, "0x", 2) || !strncmp(p->name, "0X", 2))
			p->x.name = stringf("$%s", p->name + 2);
		else
			p->x.name = p->name;

	} else if (p->generated)
		p->x.name = stringf("L%s", p->name);
	else
		p->x.name = stringf("_%s", p->name);
}


extern char *infile;

/* progbeg - beginning of program */
void progbeg(argc, argv) char *argv[];
{
	print("* progbeg(), infile = %s\n", infile);

	strcpy(filename, infile);

	if (strrchr(filename, (int)'\\'))
		strcpy(filename, strrchr(filename, (int)'\\') + 1);
	else
		strcpy(filename, infile);

	if (strchr(filename, (int) '.'))
		*(char *)strchr(filename, '.') = 0;

	print("* filename: %s\n", filename);
}

/* regloc - return "id" for p's register */
unsigned regloc(p) Symbol p; {
	assert(p && p->sclass == REGISTER);
	return 0;
}

/* regoffset - return stack offset of cell that saves reg */
int regoffset(regset, regnum) {
	return -1;
}

/* sym - print symbol table entry for p, followed by str */
void sym(kind, p, str) char *kind, *str; Symbol p; {

	print("* sym() entry\n");

	assert(kind);

	print("* %s (%s) type=%t class=%k scope=",
		p->name, p->x.name, p->type, p->sclass, p->scope);

	switch (p->scope) {

		case CONSTANTS: print("CONSTANTS"); break;
		case LABELS:    print("LABELS");    break;
		case GLOBAL:    print("GLOBAL");    break;
		case PARAM:     print("PARAM");     break;
		case LOCAL:     print("LOCAL");     break;
		default:
			if (p->scope > LOCAL)
				print("LOCAL+%d", p->scope - LOCAL);
			else
				print("%d", p->scope);
	}

	if (p->scope >= PARAM && p->sclass != STATIC)
		print(" offset=%d ref=%d", p->x.offset, p->ref);
	if (glevel > 2) {
		print(" up=");
		symname(p->up);
	}

	if (str)
		print(str);

	if (pass1_flag)
		return;

	if (current_segment == CODE) {
		if (p->scope == PARAM)
			print("!%s\tequ\t%d\n", p->x.name, p->x.offset);
		else
			print("!%s\tanop\n", p->x.name);
	} else {
		if (inside_segment)
			print("!%s\tentry\n", p->x.name);
		else
			print("sym(): Error!\n");
	}
}

/* symname - print prefix, p's name, declaration source coordinate, suffix */
static void symname(p) Symbol p; {
	if (p)
		print("%s@%w.%d", p->name, &p->src, p->src.x);
	else
		print("0");
}

/* stabend - finalize stab output */
void stabend(cp, p, cpp, sp, stab) Coordinate *cp, **cpp; Symbol p, *sp, *stab; {
	int i;

	symname(p);
	print("\n");
	for (i = 0; cpp[i] && sp[i]; i++) {
		print("%w.%d: ", cpp[i], cpp[i]->x);
		symname(sp[i]);
		print("\n");
	}
}

/* stabline - emit line number information for source coordinate *cp */
void stabline(cp) Coordinate *cp; {
	if (cp->file)
		print("%s:", cp->file);
	print("%d.%d:\n", cp->y, cp->x);
}


/*************************************
* Start temporary allocation functions
*************************************/

/*
** Very simplistic temporary allocation routines,
** but should be reasonably fast.
*/

/*
** Clear temporaries
*/

static void Clear_Temps(void)

{
	memset(temps, 0, sizeof(temps));
}

/*
** Allocate single temporary
*/

static int Alloc_Single_Temp(void)

{
	int i;

	for (i=0; i<MAX_TEMPS; i++)

		if (!temps[i]) {

			temps[i] = 1;

			if ((i+1) > temps_used)
				temps_used = i + 1;

			return i;
		}

	assert(0);
}

/*
** Allocate double temporary
*/

static int Alloc_Double_Temp(void)

{
	int i;

	for (i=0; i<MAX_TEMPS-1; i++)
		if (!temps[i] && !temps[i+1]) {

			temps[i] = temps[i+1] = 2;

			if ((i + 2) > temps_used)
				temps_used = i + 2;

			return i;
		}

	assert(0);
}

/*
** Allocate quad temporary
*/

static int Alloc_Quad_Temp(void)

{
	int i;

	for (i=0; i<MAX_TEMPS-3; i++)
		if (!temps[i] && !temps[i+1] && !temps[i+2] && !temps[i+3]) {

			temps[i] = temps[i+1] = temps[i+2] = temps[i+3] = 4;

			if ((i + 4) > temps_used)
				temps_used = i + 4;

			return i;
		}

	assert(0);
}

/*
** Allocate automagic size temporary
*/

static int Alloc_Auto_Temp(Node p)

{
	switch(optype(p->op)) {

		case C: case S:
			return Alloc_Single_Temp();

		case I: case U: case P: case F:
			return Alloc_Double_Temp();

		case D:
			return Alloc_Quad_Temp();

		default:
			error("Attempted to allocate unknown temporary size\n");
	}
}

/*
** Deallocate temporary
*/

static void Free_Temp(int temp_num)

{
	if (temps[temp_num] == 1)
		temps[temp_num] = 0;
	else if (temps[temp_num] == 2) {
		temps[temp_num]   = 0;
		temps[temp_num+1] = 0;
	} else if (temps[temp_num] == 4) {
		temps[temp_num]   = 0;
		temps[temp_num+1] = 0;
		temps[temp_num+2] = 0;
		temps[temp_num+3] = 0;
	} else {
		print("Free_Temp(): temp%d already deallocated");
		assert(0);
	}
}

/*************************************
* End temporary allocation functions
*************************************/

/*************************************
* Start pass 1 (gen) functions
*************************************/

int global_temp_num;

/*
** gen1 - Initialize nodes recusively
*/

static int gen1(Node p, int lev, int n)

{
	if (p && p->x.id == 0) {

		p->x.lev  = lev;

		/* Hacks here */

		p->x.count2       = 0;
		p->x.cache_flag   = 0;
		p->x.loaded1_flag = 0;
		p->x.loaded2_flag = 0;
		p->x.loaded3_flag = 0;
		p->x.temp_num     = -1;
		p->x.temp2_num	  = -1;
		p->x.visit_flag   = 0;

		/* End hack */

		p->x.id = ++n;

		n = gen1(p->kids[0], lev + 1, n);
		n = gen1(p->kids[1], lev + 1, n);

		*tail = p;
		tail = &p->x.next;
	}

	return n;
}

/*
** Cache check
**
** Check if something is feasible to cache.
*/

static int Cache_Check(Node p)

{
	if (generic(p->op) == ADDRL)
		return 0;

	if (generic(p->op) == ADDRF)
		return 0;

	if (generic(p->op) == CNST)
		return 0;

	if ((generic(p->op) == INDIR) && (generic(p->kids[0]->op == ADDRL)))
		return 0;

	if ((generic(p->op) == INDIR) && (generic(p->kids[0]->op == ADDRF)))
		return 0;

	return 1;
}

/*
** gen2
**
** Set cache flags
*/

static void gen2(Node p)

{
	if (!p)
		return;

	p->x.count2++;

	if (!p->x.visit_flag) {
		p->x.visit_flag = 1;
		gen2(p->kids[0]);
		gen2(p->kids[1]);
	} else
		p->x.cache_flag = Cache_Check(p);
}

/*
** gen3
**
** Allocate temporaries
*/

static void gen3(Node p)

{
	if (!p)
		return;

 	gen3(p->kids[0]);
 	gen3(p->kids[1]);

/*	print("node: %d\n", p); */

	if (p->x.cache_flag)
		if (p->x.loaded1_flag) {
			if (!--p->x.count2) {
/*				print("  Freed temp: %d\n", p->x.temp_num); */
				Free_Temp(p->x.temp_num);
			}
			return;
		} else {
			p->x.loaded1_flag = 1;
			p->x.loaded2_flag = 0;	/* Paranoia */
			p->x.loaded3_flag = 0;
			p->x.temp_num = Alloc_Double_Temp();
			p->x.count2--;
/*			print("  Allocated temp: %d\n", p->x.temp_num); */
		}

}

/*
** gen4
**
** Print node
*/

static void gen4(Node p, int spaces)

{
	int i;

	if (!p)
		return;

	print("* ");

	for (i=0; i<spaces; i++)
		print(" ");

	print("%d %s (refs: %d)", p, opname(p->op), p->x.count2);

	if (p->syms[0] && p->syms[0]->x.name)
		print(" (%s)", p->syms[0]->x.name);

	if (p->x.cache_flag)
		print(" (*CACHED*)", p);

	print("\n");

	spaces += 4;

	gen4(p->kids[0], spaces);
	gen4(p->kids[1], spaces);
}

/*
** gen - generate code for the dags on list p
*/

Node gen(Node start)

{
	int n;
	Node nodelist, p;

	print("*\n* gen() called\n*\n");

	global_temp_num = 0;

	tail = &nodelist;
	for (n = 0, p = start; p; p = p->link) {
		switch (generic(p->op)) {	/* check for valid nodelist */

			case CALL:
				break;
			case ARG:
			case ASGN: case JUMP: case LABEL: case RET:
			case EQ:   case GE:   case GT:    case LE:
 			case LT:   case NE:
				assert(p->count == 0);
				break;
			case INDIR:
				assert(p->count > 0);
				break;
			default:
				assert(0);
		}

		n = gen1(p, 0, n);
	}

	for (p = start; p; p = p->link)
		gen2(p);

	for (p = start; p; p = p->link)
		gen4(p, 0);

	for (p = start; p; p = p->link)
		gen3(p);

	*tail = 0;

	return nodelist;
}

/*************************************
* End pass 1 (gen) functions
*************************************/

/*************************************
* Start pass 2 (emit) functions
*************************************/

/*
** Debug_Emit_Nodes() subroutine
*/

static void Priv_Debug_Emit_Nodes_Sub(Node p, int spaces)

{
	int i;

	if (!p)
		return;

	for (i=0; i<spaces; i++)
		print(" ");

	print("%s(", opname(p->op));

	if ((generic(p->op) != ASGN) && p->syms[0] && p->syms[0]->x.name)
		print("%s)", p->syms[0]->x.name);

	if (p->kids[0]) {

		Priv_Debug_Emit_Nodes_Sub(p->kids[0], 1);

		if (p->kids[1]) {
			print(",");
			Priv_Debug_Emit_Nodes_Sub(p->kids[1], 1);
		}
	}

	print(")");
}

/*
** Debug_Emit_Nodes()
*/

static void Debug_Emit_Nodes(Node p, int spaces)
{
	print("* DEN: ");

	Priv_Debug_Emit_Nodes_Sub(p, spaces);

	print("\n");
}

/*
** Emit variables subroutine
*/

static void Emit_Vars_Sub(Node p, int *flag)

{
	if (!p)
		return;

	if (p->x.cache_flag && p->x.loaded3_flag) {

		if (*flag)
			print(",");
		else
			*flag = 1;

		print("gen_temp%d", p->x.temp_num);

		return;
	}

	if (p->kids[1]) {
		Emit_Vars_Sub(p->kids[1], flag);
		Emit_Vars_Sub(p->kids[0], flag);
	} else if (p->kids[0])
		Emit_Vars_Sub(p->kids[0], flag);

	if ((generic(p->op) != ASGN) && (generic(p->op) != ARG) &&
		p->syms[0] && p->syms[0]->x.name) {

		if (*flag)
			print(",");
		else
			*flag = 1;

		print("%s", p->syms[0]->x.name);
	}

	if (p->op == ARGB) {

		if (*flag)
			print(",");
		else
			*flag = 1;

		print("%s", p->syms[0]->name);

#if 0
	} else if (p->op == CALLB) {

		if (*flag)
			print(",");
		else
			*flag = 1;

		print("%d", p->kids[1]->syms[0]->type->size);
#endif

	} else if (p->op == ASGNB) {

		if (*flag)
			print(",");
		else
			*flag = 1;

		print("%d", p->kids[1]->kids[0]->syms[0]->type->size);
	}

	if (p->x.cache_flag && !p->x.loaded3_flag) {

		if (*flag)
			print(",");
		else
			*flag = 1;

		print("gen_temp%d", p->x.temp_num);

		p->x.loaded3_flag = 1;
	}
}

/*
** Emit code subroutine
*/

static void Emit_Code_Sub(Node p, int *var_num)

{
	if (!p)
		return;

	if (p->x.cache_flag) {
		if (p->x.loaded2_flag) {
			print("INDIRI(ADDRLP(%%%d))", (*var_num)++);
			return;
		} else
			print("ASGNI(");
	}

	if (p->op == ADDRFP)
		p->op = ADDRLP;

	print("%s(", opname(p->op));

	if (p->kids[1]) {
		Emit_Code_Sub(p->kids[1], var_num);
		print(",");
		Emit_Code_Sub(p->kids[0], var_num);
	} else if (p->kids[0])
		Emit_Code_Sub(p->kids[0], var_num);

	if ((generic(p->op) != ASGN) && (generic(p->op) != ARG) &&
		p->syms[0] && p->syms[0]->x.name) {

		if (p->kids[0] || p->kids[1])
			print(",");

		print("%%%d", (*var_num)++);
	}

	if ((p->op == ARGB) || (p->op == ASGNB))
		print(",%%%d", (*var_num)++);

	print(")");

	if (p->x.cache_flag && !p->x.loaded2_flag) {
		print(",ADDRLP(%%%d))", (*var_num)++);
		p->x.loaded2_flag = 1;
	}
}

/*
** Emit code
*/

static void Emit_Code(Node p)
{
	int num = 0, flag = 0;
	int temp_num;

	Emit_Code_Sub(p, &num);
	print(",(");
	Emit_Vars_Sub(p, &flag);
	print(")\n");
}

/*
** emit - emit the dags on list p
*/

void emit(p) Node p; {

	Node current;

    print("* Emit() here\n");

	for (current=p; current; current=current->x.next)
		if (!current->x.lev) {
			Emit_Code(current);
		}
}

/*************************************
* End pass 2 (emit) functions
*************************************/

/*************************************
* Start miscellaneous functions
*************************************/

/*
** function prologue
*/

void func_prologue(int size)
{
	print("LINK(),()\n");
}

/*
** function epilogue
*/

void func_epilogue(int size)
{
}

/*
** blockbeg - begin a compound statement
*/

void blockbeg(Env *e)
{
	print("* blockbeg()\n");
	memcpy(e, temps, sizeof(temps));
}

/*
** blockend - end a compound statement
*/

void blockend(Env *e)
{
	print("* blockend()\n");

	memcpy(temps, e, sizeof(temps));
}

/*
** local
**
** locals are initialized here
*/

void local(p) Symbol p; {

	print("* local(%s)\n", p->name);

/*	frame_offset = roundup(frame_offset, p->type->align); */

	if (nasty_kludge_flag) {
		nasty_kludge_flag = 0;
		ret_struct = p;
		p->x.name  = stringf("retstruct");
		return;
	}

	p->x.name   = stringf("_%s", p->name);
	p->x.offset = frame_offset;

	print("!%s\tequ\t%d\n", p->x.name, p->x.offset);

	frame_offset += p->type->size;
}

/*
** Switch to specified segment
*/

void segment(int num)

{
	print("* segment()\n");

	switch(num) {

		case CODE:

			if (inside_segment)
				print("!\tend\n");

			current_segment = CODE;
			inside_segment  = 1;
			break;

		case BSS: case DATA: case LIT: case SYM:

			if (current_segment == DATA)
				return;

			if (inside_segment)
				print("!\tend\n");

			print("!%s%d\tdata\n", filename, data_segment_num++);

			current_segment = DATA;
			inside_segment  = 1;
			break;
	}
}


/*
** End of program
*/

void progend(void)

{
	segment(CODE);
	print("FLUSH(),()\n");
}

/*************************************
* End miscellaneous functions
*************************************/

/*************************************
* Start main function
*************************************/

/*
** emit - emit the dags on list p
*/

void emit2(p)

{
	Node current;

    print("* Emit() here\n");
}

/*
** Debug code nodes
*/

void Debug_Code(void)

{
	Code cp;

	for (cp = &codehead; cp != 0; cp=cp->next) {

		switch(cp->kind) {

			case Address:

				print("* Address\n");
				break;

			case Asm:

				print("* Asm\n");
				break;

			case Blockbeg:

				print("* Blockbeg\n");
				break;

			case Blockend:

				print("* Blockend\n");
				break;

			case Label:

				print("* Label\n");
				goto gen2;

			case Local:

				print("* Local\n");
				break;

			case Defpoint:

				print("* Defpoint\n");
				break;

			case Gen:

				print("* Gen\n");
gen2:
				break;

			case Jump:

				print("* Jump\n");
				goto gen2;


			case Start:

				print("* Start\n");
				break;

			case Switch:

				print("* Switch\n");
				break;

			default:

		 		print("* (Unknown - default)\n");
				break;
		}
	}
}

/*
** function - generate code for a function
*/

/* Ickage from c/output.c */

static char *tokens[] = {
#define xx(a,b,c,d,e,f,g) g,
#define yy xx
#include "token.h"
};

void function(Symbol f, Symbol caller[], Symbol callee[], int ncalls)

{
	int i;

	pass1_flag = 1;

	print("STARTFUNC(%%0),(%s)\n", f->x.name);

	sym("function", f, ncalls ? 0 : "\n");

	if (f->type->type->op == STRUCT)
		nasty_kludge_flag = 1;
	else
		nasty_kludge_flag = 0;

	ret_struct = 0;

	if (ncalls)
		print(" ncalls=%d\n", ncalls);

	/* Pass 1 */

	Clear_Temps();

	print("************************** PASS 1 **************************\n");

	deep_stack_flag = 0;
	temps_used = 0;
	frame_offset = 1;

	gencode(caller, callee);

	print("!dag_temp_start\tequ\t%d\n", frame_offset);
	print("!\t&marktemps\n");
	print("* temps_used: %d\n", temps_used);

	frame_offset = 0;

	for (i=0; i<temps_used; i++) {
		print("!gen_temp%d\tequ\tgen_temp_start+%d\n", i, frame_offset);
		frame_offset += 2;
	}

	print("!local\tequ\tgen_temp_start+%d\n", frame_offset-1);

	print("* retaddr at: %d\n", frame_offset);
	frame_offset += 3;
	print("*  old dp at: %d\n", frame_offset);
	frame_offset += 2;

	local_stack_frame = frame_offset - 1;

	print("* parms: %d, %d\n", caller[i], callee[i]);

	if (ret_struct) {
		print("!%s\tequ\tgen_temp_start+%d\n", ret_struct->x.name, frame_offset);
		frame_offset += 4;
	}

	for (i = 0; caller[i] && callee[i]; i++) {

		caller[i]->x.name = stringf("_%s", caller[i]->name);
		callee[i]->x.name = stringf("_%s", callee[i]->name);
		caller[i]->x.offset = callee[i]->x.offset = frame_offset;

		frame_offset += caller[i]->type->size;

		print("!%s\tequ\tgen_temp_start+%d\n", callee[i]->x.name, callee[i]->x.offset);
	}

	if (frame_offset > 256)
		error("function uses more than 256 bytes of stack space!\n");

	func_prologue(local_stack_frame);

	/* Pass 2 */

	print("************************** PASS 2 **************************\n");

	pass1_flag     = 0;
	argument_space = 0;

	Debug_Code();

	emitcode();

	func_epilogue(local_stack_frame);

	print("ENDFUNC(%%0),(%s)\n", f->x.name);
	print("FLUSH(),()\n");
}

/*************************************
* End main function
*************************************/

