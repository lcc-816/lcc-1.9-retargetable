
/*
** DAG2GS2.C
**
** by Toshiyasu Morita
**
**   Started: 12/12/93 @  3:36 pm
** Rewritten:  2/28/94 @ 12:20 am
*/

#include <assert.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
** Defines
*/

#define MAX_LINE_SIZE    8192
#define MAX_CODE_SIZE   16384
#define MAX_OUTPUT_SIZE   256

#define max(x,y) ((x > y) ? x : y)

/*
** Types
*/

typedef struct DAG_STRUCT_TAG {

	struct DAG_STRUCT_TAG *next;
	char *dag, *code;

} DAG_STRUCT;

/*
** Globals
*/

DAG_STRUCT *dags[256];
char *generic_buffer;
char *vars[256];
char huge_buffer[8192];

FILE *outfile;
int last_temp;
int stack_depth = 0;

/**************************************
* Start dag list code
**************************************/

/*
** Calculate hash value
*/

int Calc_Hash(char *string)

{
	int value = 0;

	while (*string)
		value ^= (*string++ | 0x80);

	return value;
}

/*
** Add dag
*/

DAG_STRUCT *Add_Dag(char *dag, char *code)

{
	int dag_size, hash_value;
	DAG_STRUCT *new_dag;

	dag_size = sizeof(DAG_STRUCT) + strlen(dag) + strlen(code) + 2;

	new_dag = calloc(1, dag_size);
	assert(new_dag != 0);

	new_dag->dag  = (char *)new_dag + sizeof(DAG_STRUCT);
	new_dag->code = new_dag->dag + strlen(dag) + 1;

	strcpy(new_dag->dag,  dag);
	strcpy(new_dag->code, code);

	hash_value = Calc_Hash(dag);

	if (dags[hash_value])
		new_dag->next = dags[hash_value];

	dags[hash_value] = new_dag;

	return new_dag;
}


/*
** Convert dag to generic form
*/

void Convert_Generic_Dag(char *dag, char *new_dag)

{
	char *source, *dest = new_dag;
	char *percent_p;
	int length;

	for (source = dag; *source;) {

		if (*source == '%') {

			*dest++ = 'x';

			do
				source++;
			while (*source && (isdigit(*source) || (*source == 'x')));

		} else {

			if (percent_p = strchr(source, '%'))
				length = (long)percent_p - (long)source;
			else
				length = strlen(source);

			strncpy(dest, source, length);
			source += length;
			dest   += length;
		}
	}

	*dest = 0;
}

/*
** Find dag
*/

char *Find_Dag(char *dag)

{
	int hash_value;
	DAG_STRUCT *current;

	hash_value = Calc_Hash(dag);

	for (current = dags[hash_value]; current; current = current->next)
		if (!strcmp(current->dag, dag))
			return current->code;

	return 0;
}

/*
** Find generic dag
*/

char *Find_Generic_Dag(char *dag)

{
	Convert_Generic_Dag(dag, generic_buffer);

	return Find_Dag(generic_buffer);
}

/*
** Initialize dags
*/

void Init_Dags(void)

{
	memset(dags, 0, sizeof(dags));

	generic_buffer = malloc(MAX_LINE_SIZE);
	assert(generic_buffer != 0);
}

/*
** Uninitialize dags
*/

void Uninit_Dags(void)

{
	free(generic_buffer);
}

/*
** Debug dags
*/

void Debug_Dags(void)

{
	int i;
	DAG_STRUCT *current;

	for (i=0; i<256; i++) {

		if (dags[i]) {

			printf("hash: %d\n", i);

			for (current = dags[i]; current; current = current->next)
				printf("  %s\n%s", current->dag, current->code);
		}
	}
}

/**************************************
* End dag list code
**************************************/

/**************************************
* Start dag file code
**************************************/

/*
** Check dag
**
** Make sure parentheses are balanced.
*/

void Check_Dag(char *dag_name, char *filename, int line_num)

{
	int nest_level = 0;
	char c, *string = dag_name;

	while (c = *string++) {

		if (c == '(')
			nest_level++;
		else if (c == ')')
			nest_level--;
	}

	if (!nest_level)
		return;

	fprintf(stderr, "Check_Dag(): unbalanced parens: \"%s\"\n", dag_name);
	fprintf(stderr, "  in file: %s, line: %d\n", filename, line_num);

	exit(1);
}

/*
** Read dag file
*/

void Read_Dag_File(char *filename)

{
	char *dag_name, *code_buffer, *buffer;
	int line_num = 1;
	FILE *infile;

	buffer = calloc(1, MAX_LINE_SIZE + 1);
	assert(buffer != 0);

	dag_name = calloc(1, MAX_LINE_SIZE + 1);
	assert(dag_name != 0);

	code_buffer = calloc(1, MAX_CODE_SIZE + 1);
	assert(code_buffer != 0);

	if (!(infile = fopen(filename, "r"))) {
		printf("Read_DAG_File(): Unable to open dag file\n");
		exit(1);
	}

	fgets(buffer, MAX_LINE_SIZE, infile);

	while (!feof(infile)) {

		if (*buffer != ';') {

			if (isspace(*buffer)) {
				strcat(buffer, "\n");
				strcat(code_buffer, buffer);
			} else {

				if (strlen(dag_name))
					Add_Dag(dag_name, code_buffer);

				Check_Dag(buffer, filename, line_num);

				strcpy(dag_name, buffer);
				*code_buffer = 0;
			}
		}

		fgets(buffer, MAX_LINE_SIZE, infile);

		if (*buffer)
			buffer[strlen(buffer)-1] = 0;	/* Remove trailing '\n' */

		line_num++;
	}

/*	Debug_Dags(); */

	fclose(infile);
	free(code_buffer);
	free(dag_name);
	free(buffer);
}

/**************************************
* End dag file code
**************************************/

/**************************************
* Start string code
**************************************/

/*
** Derive left and right halves
*/

void Split_Dag_Line(char *dag, char **oper, char **left_side, char **right_side,
	char **tail_side, int *oper_length, int *left_length, int *right_length, int *tail_length)

{
	char *source;
	int nest_level, index, op_end;
	int left_start, left_end, right_start, right_end, tail_start, tail_end;

	left_start  = left_end  = 0;
	right_start = right_end = 0;
	tail_start  = tail_end  = 0;

	for (source = dag, nest_level = index = 0; *source; source++, index++) {

		if (*source == '(') {

			if (++nest_level == 1) {
				left_start = index + 1;
				op_end     = index;
			}

		} else if (*source == ',') {

			if (nest_level == 1) {

				if (right_start)
					tail_start = (right_end = index) + 1;
				else
					right_start = (left_end = index) + 1;
			}

		} else if (*source == ')')

			if (!--nest_level) {
				if (!left_end)
					left_end  = index;
				else if (tail_start)
					tail_end  = index;
				else
					right_end = index;
				break;
			}
	}

	while (isspace(dag[op_end - 1]))		/* Remove trailing spaces */
		op_end--;

	*oper        = dag;
	*oper_length = op_end;

	while (isspace(dag[left_start]))		/* Remove leading spaces */
		left_start++;

	while (isspace(dag[left_end - 1]))		/* Remove trailing spaces */
		left_end--;

	if (left_start > left_end)
		left_start = left_end;

	*left_side   = dag + left_start;
	*left_length = left_end - left_start;

	while (isspace(dag[right_start]))		/* Remove leading spaces */
		right_start++;

	while (isspace(dag[right_end - 1]))		/* Remove trailing spaces */
		right_end--;

	if (right_start > right_end)
		right_start = right_end;

	*right_side   = dag + right_start;
	*right_length = right_end - right_start;

	while (isspace(dag[tail_start]))		/* Remove leading spaces */
		tail_start++;

	while (isspace(dag[tail_end - 1]))		/* Remove trailing spaces */
		tail_end--;

	if (tail_start > tail_end)
		tail_start = tail_end;

	*tail_side   = dag + tail_start;
	*tail_length = tail_end - tail_start;
}

/*
** Make new string
*/

char *New_String(char *string, int length)

{
	char *new_string;

	if (length <= 0)
		length = 0;

	new_string = malloc(length + 1);
	assert(new_string != 0);

	strncpy(new_string, string, length);
	new_string[length] = 0;

	return new_string;
}

/*
** Create string
*/

char *Create_String(char *frag1, char *frag2, char *frag3, char *frag4)

{
	char *string;

	string = malloc(strlen(frag1) + strlen(frag2) + strlen(frag3) + strlen(frag4) + 1);
	assert(string != 0);

	strcpy(string, frag1);
	strcat(string, frag2);
	strcat(string, frag3);
	strcat(string, frag4);

	return string;
}

#if 0

int Get_Number(char *string, int *value, int *length);

/*
** Find last variable number
*/

int Find_Last_Var(char *string)

{
	char *last_var_p;
	int last_var, temp;

	last_var_p = strrchr(string, '%');

	if (last_var_p) {
		Get_Number(last_var_p + 1, &last_var, &temp);

		printf("last_var: %d\n", last_var);
		return last_var + 1;
	}

	return 0;
}

/*
** Create oper+left
*/

char *Create_Oper_Left(char *oper, char *left, char *tail)

{
	char temp[8];
	int last_var;

	last_var = Find_Last_Var(left);

	if (strlen(tail)) {
		sprintf(temp, ",%%%d,%%%d)", last_var, last_var + 1);
		return Create_String(oper, "(", left, temp);
	} else {
		sprintf(temp, ",%%%d)", last_var);
		return Create_String(oper, "(", left, temp);
	}
}

#endif

/*
** Create oper only
*/

char *Create_Oper_Only(char *oper, char *left, char *right, char *tail)

{
	char *string;

	if (!strlen(left) || !strlen(right)) {
		string = malloc(strlen(oper) + 5);
		assert(string != 0);
		strcpy(string, oper);
		strcat(string, "(%0)");
	} else if (strlen(tail)) {
		string = malloc(strlen(oper) + 11);
		assert(string != 0);
		strcpy(string, oper);
		strcat(string, "(%0,%1,");
		strcat(string, tail);
		strcat(string, ")");
	} else {
		string = malloc(strlen(oper) + 8);
		assert(string != 0);
		strcpy(string, oper);
		strcat(string, "(%0,%1)");
	}

	return string;
}

/**************************************
* End string code
**************************************/

/**************************************
* Start temporary code
**************************************/

int temps[256];

typedef struct TEMP_TAG {

	struct TEMP_TAG *prev, *next;
	int temp_id, temp_num;

} TEMP;

/*
** Initialize temporaries
*/

void Init_Temps(void)

{
	memset(temps, 0, sizeof(temps));
}

/*
** Debug temporaries
*/

void Debug_Temps(TEMP *temp_list)

{
	TEMP *current;

	printf("temp_list: head: %p\n", &temp_list[0]);
	printf("temp_list: tail: %p\n", &temp_list[1]);

	for (current = temp_list[0].next; current != &temp_list[1]; current = current->next)
		printf("temp_node: %p, prev: %p, next: %p, id: %d, num: %d\n",
			current, current->prev, current->next, current->temp_id, current->temp_num);
}

/*
** Clear temporary list
*/

void Clear_Temps(TEMP *temp_list)

{
	memset(temp_list, 0, sizeof(TEMP) * 2);

	temp_list[0].next = &temp_list[1];
	temp_list[1].prev = &temp_list[0];

	last_temp = 0;
}

/*
** Allocate temporary
*/

int Alloc_Temp(TEMP *temp_list, int temp_id)

{
	int i;
	TEMP *temp_node;

	for (i=0; i<256; i++)
		if (!temps[i]) {

			temps[i] = 1;

			last_temp = max(last_temp, i + 1);

			temp_node = malloc(sizeof(TEMP));
			assert(temp_node != 0);

			temp_node->temp_id  = temp_id;
			temp_node->temp_num = i;

			temp_node->prev       = temp_list;
			temp_node->next       = temp_list->next;
			temp_node->prev->next = temp_node;
			temp_node->next->prev = temp_node;

			return i;
		}

	printf("Alloc_Temp(): Unable to allocate temporary\n");
	exit(1);
}

/*
** Free temporary
*/

void Free_Temp(TEMP *temp_list, int temp_id)

{
	TEMP *current;

	for (current = temp_list[0].next; current != &temp_list[1]; current = current->next) {

		if (current->temp_id == temp_id) {
			temps[current->temp_num] = 0;

			current->prev->next = current->next;
			current->next->prev = current->prev;

			free(current);
			return;
		}
	}

	printf("Free_Temp(): Tried to free unallocated temp_id: %d\n", temp_id);
	exit(1);
}

/*
** Check if temporary list is clear
*/

int Check_Free(TEMP *temp_list)

{
	int error_flag = 0;

	while (temp_list[0].next != &temp_list[1]) {
		Free_Temp(temp_list, temp_list[0].next->temp_id);
		error_flag = 1;
	}

	return error_flag;
}

/*
** Get temporary num
*/

int Get_Temp_Num(TEMP *temp_list, int temp_id)

{
	TEMP *current;

	for (current = temp_list[0].next; current != &temp_list[1]; current = current->next) {

		if (current->temp_id == temp_id)
			return current->temp_num;
	}

	printf("Get_Temp_Num(): temp_id: %d was never allocated!\n", temp_id);
	exit(1);
}

/**************************************
* End temporary code
**************************************/

/**************************************
* Start output code
**************************************/

typedef struct LINE_TAG {

	struct LINE_TAG *prev, *next;
	char text[1];

} LINE;

LINE output_lines[2];

/*
** Init output lines
*/

void Init_Output(void)

{
	output_lines[0].prev = output_lines[1].next = 0;
	output_lines[0].next = &output_lines[1];
	output_lines[1].prev = &output_lines[0];
}

/*
** Add output to buffer
*/

void Add_Output_Buffer(char *text)

{
	LINE *line;

	line = malloc(sizeof(LINE) + strlen(text));
	assert(line != 0);

	line->prev = output_lines[1].prev;
	line->next = &output_lines[1];
	line->prev->next = line;
	line->next->prev = line;

	strcpy(line->text, text);
}

/*
** Output special
*/

int Output_Special(char *special, FILE *outfile)

{
	int i, offset;

	special++;

	if (!strncmp(special, "marktemps", 9)) {

		offset = 0;

		for (i=0; i<last_temp; i++) {
			fprintf(outfile, "dag_temp%d\tequ\tdag_temp_start+%d\n", i, offset);
			offset += 4;
		}

		fprintf(outfile, "gen_temp_start\tequ\tdag_temp_start+%d\n", offset);
		return 0;
	}

	return 1;
}

/*
** Flush output buffer
*/

void Flush_Output_Buffer(FILE *outfile)

{
	char *special;
	int output_flag;
	LINE *current, *next;

	for (current = output_lines[0].next; current != &output_lines[1];) {

		special = strchr(current->text, '&');

		if (special)
			output_flag = Output_Special(special, outfile);
		else
			output_flag = 1;

		if (output_flag) {
			fputs(&current->text, outfile);
			putc('\n', outfile);
		}

		next = current->next;
		free(current);
		current = next;
	}

	output_lines[0].next = &output_lines[1];
	output_lines[1].prev = &output_lines[0];
}

/**************************************
* End output code
**************************************/

/**************************************
* Start program dag code
**************************************/

void Output_Dag_Recursive(char *dag);

/*
** Get number
*/

int Get_Number(char *string, int *value, int *length)

{
	int flag = 0, invert_flag = 0;

	while (*string && isspace(*string))
		string++;

	if (*string == '-') {
		string++;
		invert_flag = 1;
	}

	for (*value = *length = 0; isdigit(*string); string++) {
		*value *= 10;
		*value += *string - '0';
		(*length)++;
		flag = 1;
	}

	if (invert_flag)
		*value = -*value;

	return flag;
}

/*
** Get variable name
*/

char *Get_Variable_Name(char *dag, int arg_num)

{
	char *string;
	int i, value, length;

	for (i=0, string=dag; i<=arg_num; i++) {

		string = strchr(string, '%');

		if (!string) {
			printf("Get_Variable_Name(): tried to access arg %d of %s\n",
				arg_num, dag);
			exit(0);
		}
		assert(string != 0);
		string++;
	}

	if (!Get_Number(string, &value, &length)) {
		printf("Get_Variable_Name(): invalid variable!\n");
		exit(1);
	}

	return vars[value];
}

/*
** Output special line
*/

void Output_Special_Line(char *dag, char *line, char *left, char *right, TEMP *temp_list)

{
	char *special;
	static char buffer[MAX_OUTPUT_SIZE];
	int value, copy_length, length, temp_id, temp_num, size;
	int print_line = 1, print_buffer = 0;

	special = strchr(line, '%');
	assert(special != 0);

	special++;

	if (!strncmp(special, "left", 4)) {
		assert(left != 0);
		Output_Dag_Recursive(left);
		print_line = 0;
	} else if (!strncmp(special, "right", 5)) {
		assert(right != 0);
		Output_Dag_Recursive(right);
		print_line = 0;
	} else if (!strncmp(special, "label", 5)) {
		strcpy(buffer, Get_Variable_Name(dag, 0));
		strcat(buffer, special + 5);
		print_line   = 0;
		print_buffer = 1;
	} else if (!strncmp(special, "arg", 3)) {
		Get_Number(special + 3, &value, &length);
		copy_length = (int)special - (int)line - 1;
		strncpy(buffer, line, copy_length);
		buffer[copy_length] = 0;
		strcat(buffer, Get_Variable_Name(dag, value));
		strcat(buffer, special + 3 + length);
		print_line   = 0;
		print_buffer = 1;
	} else if (!strncmp(special, "alloctemp", 9)) {
		Get_Number(special + 9, &temp_id, &length);
		temp_num = Alloc_Temp(temp_list, temp_id);
		print_line = 0;
	} else if (!strncmp(special, "freetemp", 8)) {
		Get_Number(special + 8, &temp_id, &length);
		Free_Temp(temp_list, temp_id);
		print_line = 0;
	} else if (!strncmp(special, "temp", 4)) {
		Get_Number(special + 4, &temp_id, &length);
		temp_num = Get_Temp_Num(temp_list, temp_id);
		copy_length = (int)special - (int)line - 1;
		strncpy(buffer, line, copy_length);
		sprintf(buffer + copy_length, "r%d", temp_num);
		strcat(buffer, special + 4 + length);
		print_line   = 0;
		print_buffer = 1;
	} else if (!strncmp(special, "flush", 5)) {
		Flush_Output_Buffer(outfile);
		Clear_Temps(temp_list);
		print_line = 0;
	} else if (!strncmp(special, "pushstack", 9)) {
		Get_Number(special + 9, &size, &length);
		if (size < 0)
			size = atol(Get_Variable_Name(dag, -size));
		stack_depth += size;
		print_line   = 0;
	} else if (!strncmp(special, "clearstack", 10)) {
		stack_depth = 0;
		print_line  = 0;
	} else if (!strncmp(special, "stack_depth", 11)) {
		copy_length = (int)special - (int)line - 1;
		strncpy(buffer, line, copy_length);
		sprintf(buffer + copy_length, "%d", stack_depth);
		strcat(buffer, special + 11);
		print_line   = 0;
		print_buffer = 1;
	} else if (!strncmp(special, "fixstack0", 9)) {
		if (stack_depth) {
			sprintf(buffer, "\ttsc\n\tclc\n\tadc\t#%d\n\ttcs", stack_depth);
			print_buffer = 1;
		}
		print_line = stack_depth = 0;
	} else if (!strncmp(special, "fixstack1", 9)) {
		print_line = 0;
		if (stack_depth) {
			sprintf(buffer, "\ttay\n\ttsc\n\tclc\n\tadc\t#%d\n\ttcs\n\ttya", stack_depth);
			print_buffer = 1;
		}
		print_line = stack_depth = 0;
	}

	if (print_line)
		Add_Output_Buffer(line);
	else if (print_buffer)
		Add_Output_Buffer(buffer);
}

/*
** Output line
**
** Note: Not very efficient, but ohwell.
*/

void Output_Line(char *dag, char *output, char *left, char *right)

{
	char *line_buffer, *source, *eol;
	int length;
	TEMP temp_list[2];

	temp_list[0].prev = temp_list[1].next = 0;
	temp_list[0].next = &temp_list[1];
	temp_list[1].prev = &temp_list[0];

	line_buffer = malloc(MAX_OUTPUT_SIZE + 1);
	assert(line_buffer != 0);

	for (source = output; *source;) {

		eol = strchr(source, '\n');

		length = (long)eol - (long)source;

		if (eol) {
			strncpy(line_buffer, source, length);
			line_buffer[length] = 0;
		} else {
			strcpy(line_buffer, source);
			length = strlen(source);
		}

		if (strchr(line_buffer, '%'))
			Output_Special_Line(dag, line_buffer, left, right, temp_list);
		else
			Add_Output_Buffer(line_buffer);

		source += length + 1;
	}

	if (Check_Free(temp_list)) {
		fprintf(stderr, "*** WARNING: MD did not properly deallocate temporaries!\n");
		fprintf(stderr, "  dag: %s\n", dag);
	}

	free(line_buffer);
}

/*
** Output dag recursive
*/

void Output_Dag_Recursive(char *dag)

{
	char *oper, *left, *right, *oper_side, *left_side, *right_side;
	char *tail, *tail_side, *output;
	char *test_string;
	int oper_length, left_length, right_length, tail_length;

	if (output = Find_Generic_Dag(dag)) {
		Output_Line(dag, output, 0, 0);
		return;
	}

	Split_Dag_Line(dag, &oper_side, &left_side, &right_side, &tail_side,
		&oper_length, &left_length, &right_length, &tail_length);

	oper  = New_String(oper_side, oper_length);
	left  = New_String(left_side, left_length);
	right = New_String(right_side, right_length);
	tail  = New_String(tail_side, tail_length);

	printf(";   oper: %s (%d)\n", oper, oper_length);
	printf(";   left: %s (%d)\n", left, left_length);

	if (right_length)
		printf(";  right: %s (%d)\n", right, right_length);
	if (tail_length)
		printf(";   tail: %s (%d)\n", tail, tail_length);

	if (right_length) {

		test_string = Create_String(oper, "(", left, ",%x)");

		printf("; trying oper+left: %s\n", test_string);

		if (output = Find_Generic_Dag(test_string)) {
			printf(";    found it!\n");
			Output_Line(test_string, output, left, right);
			goto finished;
		}

		free(test_string);

		test_string = Create_String(oper, "(%x,", right, ")");

		printf("; trying oper+right: %s\n", test_string);

		if (output = Find_Generic_Dag(test_string)) {
			printf(";   found it!\n");
			Output_Line(test_string, output, left, right);
			goto finished;
		}
		free(test_string);
	}

	test_string = Create_Oper_Only(oper, left, right, tail);

	printf("; trying oper only: %s\n", test_string);

	if (output = Find_Generic_Dag(test_string)) {
		printf(";   found it!\n");
		Output_Line(test_string, output, left, right);
		goto finished;
	} else {
		fprintf(stderr, "; *** ERROR! COULDN'T FIND ATOMIC DAG %s!!!\n", test_string);
		printf("; *** ERROR! COULDN'T FIND ATOMIC DAG %s!!!\n", test_string);
	}


finished:

	free(test_string);
	free(oper);
	free(left);
	free(right);
	free(tail);
}

/*
** Output dag
*/

void Output_Dag(char *dag)

{
	char *output;

	if (!dag || (*dag == 0))
		return;

	printf("; verbatim dag: %s ", dag);

	/* Check if dag can be found verbatim */

	output = Find_Dag(dag);

	if (output) {
		printf("(found!)\n", output);
		Output_Line(dag, output, 0, 0);
		return;
	} else
		printf("(not found)\n");

	/* Okay, we have to grind it out */

	Output_Dag_Recursive(dag);
}

/**************************************
* End program dag code
**************************************/

/**************************************
* Start program file code
**************************************/

/*
** Split program line into dag and variables
*/

void Split_Program_Line(char *string, char **dag, char **vars,
	int *dag_length, int *vars_length)

{
	char *source;
	int index, nest_level, dag_end, vars_flag;

	dag_end = nest_level = vars_flag = 0;

	for (source = string, index = 0; *source; source++, index++) {

		if (*source == '(')
			nest_level++;
		else if ((*source == ',') && !nest_level)
			dag_end = index;
		else if (*source == ')')
			nest_level--;
	}

	*dag        = string;
	*dag_length = dag_end;

	*vars        = string + dag_end + 1;
	*vars_length = strlen(string) - dag_end;
}

/*
** Separate variables
*/

void Separate_Variables(char *vars_buffer)

{
	char *source, *temp;
	int index = 0, i;

	if (!strlen(vars_buffer))
		return;

	if (*vars_buffer++ != '(') {
		printf("Separate_Variables(): failed on string: %s\n", vars_buffer);
		exit(1);
	}

	memset(vars, 0, sizeof(vars));

	for (source = vars_buffer;;) {

		vars[index++] = source;

		if (temp = strchr(source, ',')) {
			*temp = 0;
			source = temp + 1;
		} else if (temp = strchr(source, ')')) {
			*temp = 0;
			source = temp + 1;
			break;
		}
	}

	for (i=0; i<256; i++)
		if (!vars[i])
			break;
		else
			printf(";   var %d: %s\n", i, vars[i]);
}

/*
** Read program file
*/

void Read_Program_File(char *filename)

{
	char *buffer, *dag_p, *vars_p, *dag_buffer, *vars_buffer;
	int line_length, dag_length, vars_length;
	FILE *infile;

	buffer = calloc(1, MAX_LINE_SIZE + 1);
	assert(buffer != 0);

	dag_buffer = calloc(1, MAX_LINE_SIZE + 1);
	assert(dag_buffer != 0);

	vars_buffer = calloc(1, MAX_LINE_SIZE + 1);
	assert(vars_buffer != 0);

	if (!(infile = fopen(filename, "r"))) {
		printf("Read_Program_File(): Unable to open program file\n");
		exit(1);
	}

	fgets(buffer, MAX_LINE_SIZE, infile);

	while (!feof(infile)) {

		if (!(line_length = strlen(buffer)))
			continue;

		if (buffer[line_length - 1] == '\n')
			buffer[line_length - 1] = 0;

		if (buffer[0] == '*')
			goto next_line;

		if (buffer[0] == '!') {
			Add_Output_Buffer(buffer + 1);
			goto next_line;
		}

		sprintf(huge_buffer, "; %s", buffer);
		Add_Output_Buffer(huge_buffer);

		Split_Program_Line(buffer, &dag_p, &vars_p, &dag_length, &vars_length);

		strncpy(dag_buffer, dag_p, dag_length);
		dag_buffer[dag_length] = 0;

		strncpy(vars_buffer, vars_p, vars_length);
		vars_buffer[vars_length] = 0;

		printf(";     dag: %s\n", dag_buffer);
		printf(";    vars: %s\n", vars_buffer);
		Separate_Variables(vars_buffer);

		Output_Dag(dag_buffer);

next_line:
		fgets(buffer, MAX_LINE_SIZE, infile);
	}

	fclose(infile);
	free(vars_buffer);
	free(dag_buffer);
	free(buffer);
}

/**************************************
* End program file code
**************************************/

void main(int argc, char **argv)

{
	int i, opt_level, length;

	if (argc < 3) {
		printf("usage: dag2gs2 <input file> <output file>\n");
		printf(" input file: lcc output .dag file\n");
		printf("output file: ORCA/M .asm file\n");
		exit(0);
	}

	opt_level = 3;

	for (i=1; argv[i][0] == '-'; i++) {

		if (!strncmp(argv[i], "-O", 2)) {
			Get_Number(argv[i]+2, &opt_level, &length);

			if ((opt_level < 0) || (opt_level > 3)) {
				printf("Invalid optimization level: %d\n", opt_level);
				exit(1);
			}
		}
	}

	Init_Dags();
	Init_Temps();
	Init_Output();

	if (opt_level >= 0)
		Read_Dag_File("opt0.dag");

	if (opt_level >= 1)
		Read_Dag_File("opt1.dag");

	if (!(outfile = fopen(argv[i+1], "wt"))) {
		printf("Error: couldn't open output file\n");
		exit(1);
	}

	setvbuf(outfile, 0, _IOFBF, 32768);

	printf("Input file: %s\n", argv[i]);
	Read_Program_File(argv[i]);

	Flush_Output_Buffer(outfile);
	fclose(outfile);

	Uninit_Dags();
}
