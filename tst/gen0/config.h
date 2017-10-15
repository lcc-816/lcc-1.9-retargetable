/* C compiler: symbolic configuration parameters */

/* type metrics: size,alignment,constants */
#define CHAR_METRICS		1,1,0
#define SHORT_METRICS		2,2,0
#define INT_METRICS		    4,4,0
#define FLOAT_METRICS		4,4,1
#define DOUBLE_METRICS		8,4,1
#define POINTER_METRICS		4,4,0
#define	STRUCT_ALIGN		2		/* So we don't have to switch to m=1 */

#define LITTLE_ENDIAN		/* define for right-to-left bit fields */
#define JUMP_ON_RETURN	1

/* Debug */

typedef struct {

	int temp[256];

} Env;

typedef struct {
	short lev;		/* node nesting level */
	short id;		/* node identification number */
	int state;
	Node next;		/* next node on output list */

	/* IIGS mods */

	short count2;

	short visit_flag;	/* Used in first pass to avoid visiting node twice */

	short cache_flag;	/* Cache value in a temporary */
	short loaded1_flag;	/* Value has been cached */
	short loaded2_flag;
	short loaded3_flag;
	short cache_num;	/* Cache temporary num */

	short temp_num;		/* Temporaries for code use */
	short temp2_num;

	/* New */

	int dirty_flag;


} Xnode;

typedef struct {
	char *name;		/* name for back end */
	int offset;		/* locals: frame offset */
} Xsymbol;

dclproto(extern void sym,(char *, Symbol, char *));

#define defaddress(p) print("!\tdc\ti4\'%s\'\n", (p)->x.name)
#define export(p) print("*\texport\t%s\n", (p)->x.name)
#define global(p) sym("global", (p), "\n")
#define import(p) print("*\timport %s\n", (p)->x.name)
void segment(int x);

#define space(x) print("!\tds\t%d\n", (x))

#define stabblock(a,b,c)
#define stabfend(a,b)
#define stabinit(a,b,c)
#define stabsym(a)
#define stabtype(a)
