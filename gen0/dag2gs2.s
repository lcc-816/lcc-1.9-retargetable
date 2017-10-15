* progbeg(), infile = -
* filename: -
* defsymbol: _ctype_
* defsymbol: _iob
* defsymbol: fopen
* defsymbol: fdopen
* defsymbol: freopen
* defsymbol: popen
* defsymbol: tmpfile
* defsymbol: ftell
* defsymbol: fgets
* defsymbol: gets
* defsymbol: sprintf
* defsymbol: ctermid
* defsymbol: cuserid
* defsymbol: tempnam
* defsymbol: tmpnam
* defsymbol: _mb_cur_max
* defsymbol: abort
* defsymbol: abs
* defsymbol: atof
* defsymbol: atoi
* defsymbol: atol
* defsymbol: bsearch
* defsymbol: calloc
* defsymbol: exit
* defsymbol: free
* defsymbol: getenv
* defsymbol: malloc
* defsymbol: qsort
* defsymbol: rand
* defsymbol: realloc
* defsymbol: srand
* defsymbol: mbtowc
* defsymbol: wctomb
* defsymbol: mbstowcs
* defsymbol: wcstombs
* defsymbol: strcat
* defsymbol: strchr
* defsymbol: strcmp
* defsymbol: strcpy
* defsymbol: strcspn
* defsymbol: strdup
* defsymbol: strlen
* defsymbol: strncat
* defsymbol: strncmp
* defsymbol: strncpy
* defsymbol: strpbrk
* defsymbol: strrchr
* defsymbol: strspn
* defsymbol: strstr
* defsymbol: strtok
* defsymbol: dags
* defsymbol: generic_buffer
* defsymbol: vars
* defsymbol: huge_buffer
* defsymbol: outfile
* defsymbol: last_temp
* defsymbol: stack_depth
* segment()
!-0	data
*	export	_stack_depth
* sym() entry
* stack_depth (_stack_depth) type=int class=auto scope=GLOBAL
!_stack_depth	entry
!	dc	i4'0'
* defsymbol: string
* defsymbol: Calc_Hash
* defsymbol: 0
* defsymbol: 4
* defsymbol: 3
* defsymbol: 2
* defsymbol: 1
* defsymbol: 128
* defsymbol: 4
* defsymbol: 1
* segment()
!	end
*	export	_Calc_Hash
STARTFUNC(%0),(_Calc_Hash)
* sym() entry
* Calc_Hash (_Calc_Hash) type=int function(pointer to char) class=auto scope=GLOBAL
************************** PASS 1 **************************
*
* gen() called
*
* 222832 ASGNP (refs: 1) (4)
*     222616 ADDRFP (refs: 1) (_string)
*     222760 INDIRP (refs: 1)
*         222688 ADDRFP (refs: 1) (_string)
* blockbeg()
* local(value)
!_value	equ	1
*
* gen() called
*
* 193212 ASGNI (refs: 1) (4)
*     193068 ADDRLP (refs: 1) (_value)
*     193140 CNSTI (refs: 1) (0)
*
* gen() called
*
* 195756 JUMPV (refs: 1)
*     195684 ADDRGP (refs: 1) (L3)
*
* gen() called
*
* 196972 LABELV (refs: 1) (L2)
*
* gen() called
*
* 209396 INDIRP (refs: 3) (*CACHED*)
*     209324 ADDRFP (refs: 2) (_string)
* 209612 ASGNP (refs: 1) (4)
*     209324 ADDRFP (refs: 2) (_string)
*     209540 ADDP (refs: 1)
*         209396 INDIRP (refs: 3) (*CACHED*)
*             209324 ADDRFP (refs: 2) (_string)
*         209468 CNSTI (refs: 1) (1)
* 210332 ASGNI (refs: 1) (4)
*     209108 ADDRLP (refs: 2) (_value)
*     210260 CVUI (refs: 1)
*         210188 BXORU (refs: 1)
*             209252 CVIU (refs: 1)
*                 209180 INDIRI (refs: 1)
*                     209108 ADDRLP (refs: 2) (_value)
*             210116 CVIU (refs: 1)
*                 210044 CVUI (refs: 1)
*                     209972 BORU (refs: 1)
*                         209828 CVIU (refs: 1)
*                             209756 CVCI (refs: 1)
*                                 209684 INDIRC (refs: 1)
*                                     209396 INDIRP (refs: 3) (*CACHED*)
*                                         209324 ADDRFP (refs: 2) (_string)
*                         209900 CNSTU (refs: 1) (128)
*
* gen() called
*
* 212516 LABELV (refs: 1) (L3)
*
* gen() called
*
* 214004 NEI (refs: 1) (L2)
*     213860 CVCI (refs: 1)
*         213788 INDIRC (refs: 1)
*             213716 INDIRP (refs: 1)
*                 213644 ADDRFP (refs: 1) (_string)
*     213932 CNSTI (refs: 1) (0)
*
* gen() called
*
* 216420 RETI (refs: 1)
*     216348 INDIRI (refs: 1)
*         216276 ADDRLP (refs: 1) (_value)
* blockend()
*
* gen() called
*
* 221488 LABELV (refs: 1) (L1)
!dag_temp_start	equ	5
!	&marktemps
* temps_used: 2
!gen_temp0	equ	gen_temp_start+0
!gen_temp1	equ	gen_temp_start+2
!local	equ	gen_temp_start+3
* retaddr at: 4
*  old dp at: 7
* parms: 188044, 174454
!_string	equ	gen_temp_start+9
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Emit() here
ASGNP(INDIRP(ADDRLP(%0)),ADDRLP(%1)),(_string,_string)
* Emit() here
ASGNI(CNSTI(%0),ADDRLP(%1)),(0,_value)
* Emit() here
JUMPV(ADDRGP(%0)),(L3)
* Emit() here
LABELV(%0),(L2)
* Emit() here
ASGNI(INDIRP(ADDRLP(%0)),ADDRLP(%1)),(_string,gen_temp0)
ASGNP(ADDP(CNSTI(%0),INDIRI(ADDRLP(%1))),ADDRLP(%2)),(1,gen_temp0,_string)
ASGNI(CVUI(BXORU(CVIU(CVUI(BORU(CNSTU(%0),CVIU(CVCI(INDIRC(INDIRI(ADDRLP(%1)))))))),CVIU(INDIRI(ADDRLP(%2))))),ADDRLP(%3)),(128,gen_temp0,_value,_value)
* Emit() here
LABELV(%0),(L3)
* Emit() here
NEI(CNSTI(%0),CVCI(INDIRC(INDIRP(ADDRLP(%1)))),%2),(0,_string,L2)
* Emit() here
RETI(INDIRI(ADDRLP(%0))),(_value)
* Emit() here
LABELV(%0),(L1)
ENDFUNC(%0),(_Calc_Hash)
FLUSH(),()
* defsymbol: dag
* defsymbol: code
* defsymbol: Add_Dag
* defsymbol: 12
* defsymbol: 2
* defsymbol: 0
* defsymbol: 6
* defsymbol: fprintf
* defsymbol: Assertion failed: file "%s", line %d
* defsymbol: 9
* defsymbol: dag2gs2.c
* defsymbol: 10
* defsymbol: 81
* defsymbol: 8
* defsymbol: 2
* defsymbol: 11
* defsymbol: 5
*	export	_Add_Dag
STARTFUNC(%0),(_Add_Dag)
* sym() entry
* Add_Dag (_Add_Dag) type=pointer to struct DAG_STRUCT_TAG function(pointer to char,pointer to char) class=auto scope=GLOBAL ncalls=9
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188300, 188044
!_dag	equ	gen_temp_start+5
!_code	equ	gen_temp_start+9
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Defpoint
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
ENDFUNC(%0),(_Add_Dag)
FLUSH(),()
* defsymbol: dag
* defsymbol: new_dag
* defsymbol: Convert_Generic_Dag
* defsymbol: 17
* defsymbol: 14
* defsymbol: 37
* defsymbol: 18
* defsymbol: 120
* defsymbol: 20
* defsymbol: 21
* defsymbol: 24
* defsymbol: 4
* defsymbol: 120
* defsymbol: 22
* defsymbol: 19
* defsymbol: 25
* defsymbol: 26
* defsymbol: 15
* defsymbol: 16
* defsymbol: 0
* defsymbol: 13
*	export	_Convert_Generic_Dag
STARTFUNC(%0),(_Convert_Generic_Dag)
* sym() entry
* Convert_Generic_Dag (_Convert_Generic_Dag) type=void function(pointer to char,pointer to char) class=auto scope=GLOBAL ncalls=3
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188276, 188044
!_dag	equ	gen_temp_start+5
!_new_dag	equ	gen_temp_start+9
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Blockend
* Jump
* Label
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Label
* Defpoint
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Convert_Generic_Dag)
FLUSH(),()
* defsymbol: dag
* defsymbol: Find_Dag
* defsymbol: 31
* defsymbol: 28
* defsymbol: 32
* defsymbol: 27
* defsymbol: 29
* defsymbol: 30
*	export	_Find_Dag
STARTFUNC(%0),(_Find_Dag)
* sym() entry
* Find_Dag (_Find_Dag) type=pointer to char function(pointer to char) class=auto scope=GLOBAL ncalls=2
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188172, 188044
!_dag	equ	gen_temp_start+5
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
ENDFUNC(%0),(_Find_Dag)
FLUSH(),()
* defsymbol: dag
* defsymbol: Find_Generic_Dag
* defsymbol: 34
*	export	_Find_Generic_Dag
STARTFUNC(%0),(_Find_Generic_Dag)
* sym() entry
* Find_Generic_Dag (_Find_Generic_Dag) type=pointer to char function(pointer to char) class=auto scope=GLOBAL ncalls=2
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188172, 188044
!_dag	equ	gen_temp_start+5
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
ENDFUNC(%0),(_Find_Generic_Dag)
FLUSH(),()
* defsymbol: Init_Dags
* defsymbol: memset
* defsymbol: 1024
* defsymbol: 8192
* defsymbol: 36
* defsymbol: fprintf
* defsymbol: 178
* defsymbol: 35
*	export	_Init_Dags
STARTFUNC(%0),(_Init_Dags)
* sym() entry
* Init_Dags (_Init_Dags) type=void function(void) class=auto scope=GLOBAL ncalls=4
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 0, 0
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Defpoint
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Init_Dags)
FLUSH(),()
* defsymbol: Uninit_Dags
* defsymbol: 39
*	export	_Uninit_Dags
STARTFUNC(%0),(_Uninit_Dags)
* sym() entry
* Uninit_Dags (_Uninit_Dags) type=void function(void) class=auto scope=GLOBAL ncalls=1
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 0, 0
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Blockbeg
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Uninit_Dags)
FLUSH(),()
* defsymbol: Debug_Dags
* defsymbol: 41
* defsymbol: 45
* defsymbol: printf
* defsymbol: hash: %d
* defsymbol: 47
* defsymbol: 51
* defsymbol: 48
* defsymbol:   %s%s
* defsymbol: 52
* defsymbol: 49
* defsymbol: 50
* defsymbol: 42
* defsymbol: 256
* defsymbol: 43
* defsymbol: 40
*	export	_Debug_Dags
STARTFUNC(%0),(_Debug_Dags)
* sym() entry
* Debug_Dags (_Debug_Dags) type=void function(void) class=auto scope=GLOBAL ncalls=2
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 0, 0
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Blockbeg
* Defpoint
* Gen
* Label
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Debug_Dags)
FLUSH(),()
* defsymbol: dag_name
* defsymbol: filename
* defsymbol: line_num
* defsymbol: Check_Dag
* defsymbol: 55
* defsymbol: 54
* defsymbol: 40
* defsymbol: 57
* defsymbol: 58
* defsymbol: 41
* defsymbol: 59
* defsymbol: 56
* defsymbol: 61
* defsymbol: 53
* defsymbol: fprintf
* defsymbol: Check_Dag(): unbalanced parens: "%s"
* defsymbol: 64
* defsymbol:   in file: %s, line: %d
* defsymbol: 66
*	export	_Check_Dag
STARTFUNC(%0),(_Check_Dag)
* sym() entry
* Check_Dag (_Check_Dag) type=void function(pointer to char,pointer to char,int) class=auto scope=GLOBAL ncalls=3
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188364, 188044
!_dag_name	equ	gen_temp_start+5
!_filename	equ	gen_temp_start+9
!_line_num	equ	gen_temp_start+13
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Label
* Label
* Blockend
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Check_Dag)
FLUSH(),()
* defsymbol: filename
* defsymbol: Read_Dag_File
* defsymbol: 8193
* defsymbol: 68
* defsymbol: fprintf
* defsymbol: 262
* defsymbol: 71
* defsymbol: fprintf
* defsymbol: 265
* defsymbol: 16385
* defsymbol: 74
* defsymbol: fprintf
* defsymbol: 268
* defsymbol: r
* defsymbol: 79
* defsymbol: 77
* defsymbol: printf
* defsymbol: Read_DAG_File(): Unable to open dag file
* defsymbol: 80
* defsymbol: 82
* defsymbol: 81
* defsymbol: 59
* defsymbol: 84
* defsymbol: 8
* defsymbol: 86
* defsymbol: 
* defsymbol: 89
* defsymbol: 87
* defsymbol: 90
* defsymbol: 92
* defsymbol: 16
* defsymbol: 16
* defsymbol: 83
* defsymbol: fclose
* defsymbol: 67
*	export	_Read_Dag_File
STARTFUNC(%0),(_Read_Dag_File)
* sym() entry
* Read_Dag_File (_Read_Dag_File) type=void function(pointer to char) class=auto scope=GLOBAL ncalls=25
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188148, 188044
!_filename	equ	gen_temp_start+5
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Defpoint
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Defpoint
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Defpoint
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Gen
* Jump
* Label
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Jump
* Label
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Read_Dag_File)
FLUSH(),()
* defsymbol: dag
* defsymbol: oper
* defsymbol: left_side
* defsymbol: right_side
* defsymbol: tail_side
* defsymbol: oper_length
* defsymbol: left_length
* defsymbol: right_length
* defsymbol: tail_length
* defsymbol: Split_Dag_Line
* defsymbol: 98
* defsymbol: 95
* defsymbol: 99
* defsymbol: 101
* defsymbol: 100
* defsymbol: 44
* defsymbol: 103
* defsymbol: 105
* defsymbol: 107
* defsymbol: 108
* defsymbol: 104
* defsymbol: 109
* defsymbol: 111
* defsymbol: 113
* defsymbol: 114
* defsymbol: 115
* defsymbol: 116
* defsymbol: 97
* defsymbol: 96
* defsymbol: 118
* defsymbol: 117
* defsymbol: 119
* defsymbol: 122
* defsymbol: 121
* defsymbol: 123
* defsymbol: 126
* defsymbol: 125
* defsymbol: 127
* defsymbol: 129
* defsymbol: 132
* defsymbol: 131
* defsymbol: 133
* defsymbol: 136
* defsymbol: 135
* defsymbol: 137
* defsymbol: 139
* defsymbol: 142
* defsymbol: 141
* defsymbol: 143
* defsymbol: 146
* defsymbol: 145
* defsymbol: 147
* defsymbol: 149
* defsymbol: 94
*	export	_Split_Dag_Line
STARTFUNC(%0),(_Split_Dag_Line)
* sym() entry
* Split_Dag_Line (_Split_Dag_Line) type=void function(pointer to char,pointer to pointer to char,pointer to pointer to char,pointer to pointer to char,pointer to pointer to char,pointer to int,pointer to int,pointer to int,pointer to int) class=auto scope=GLOBAL
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 189204, 188044
!_dag	equ	gen_temp_start+5
!_oper	equ	gen_temp_start+9
!_left_side	equ	gen_temp_start+13
!_right_side	equ	gen_temp_start+17
!_tail_side	equ	gen_temp_start+21
!_oper_length	equ	gen_temp_start+25
!_left_length	equ	gen_temp_start+29
!_right_length	equ	gen_temp_start+33
!_tail_length	equ	gen_temp_start+37
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Defpoint
* Defpoint
* Defpoint
* Gen
* Jump
* Label
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Defpoint
* Gen
* Blockend
* Blockend
* Jump
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Blockend
* Blockend
* Jump
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Defpoint
* Jump
* Blockend
* Label
* Label
* Label
* Label
* Blockend
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Split_Dag_Line)
FLUSH(),()
* defsymbol: string
* defsymbol: length
* defsymbol: New_String
* defsymbol: 152
* defsymbol: 154
* defsymbol: fprintf
* defsymbol: 424
* defsymbol: 151
*	export	_New_String
STARTFUNC(%0),(_New_String)
* sym() entry
* New_String (_New_String) type=pointer to char function(pointer to char,int) class=auto scope=GLOBAL ncalls=4
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188276, 188044
!_string	equ	gen_temp_start+5
!_length	equ	gen_temp_start+9
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Defpoint
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
ENDFUNC(%0),(_New_String)
FLUSH(),()
* defsymbol: frag1
* defsymbol: frag2
* defsymbol: frag3
* defsymbol: frag4
* defsymbol: Create_String
* defsymbol: 158
* defsymbol: fprintf
* defsymbol: 442
* defsymbol: 157
*	export	_Create_String
STARTFUNC(%0),(_Create_String)
* sym() entry
* Create_String (_Create_String) type=pointer to char function(pointer to char,pointer to char,pointer to char,pointer to char) class=auto scope=GLOBAL ncalls=11
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188540, 188044
!_frag1	equ	gen_temp_start+5
!_frag2	equ	gen_temp_start+9
!_frag3	equ	gen_temp_start+13
!_frag4	equ	gen_temp_start+17
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Defpoint
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
ENDFUNC(%0),(_Create_String)
FLUSH(),()
* defsymbol: oper
* defsymbol: left
* defsymbol: right
* defsymbol: tail
* defsymbol: Create_Oper_Only
* defsymbol: 164
* defsymbol: 162
* defsymbol: 5
* defsymbol: 165
* defsymbol: fprintf
* defsymbol: 512
* defsymbol: (%0)
* defsymbol: 168
* defsymbol: 163
* defsymbol: 169
* defsymbol: 11
* defsymbol: 171
* defsymbol: fprintf
* defsymbol: 517
* defsymbol: (%0,%1,
* defsymbol: 174
* defsymbol: )
* defsymbol: 175
* defsymbol: 170
* defsymbol: 176
* defsymbol: fprintf
* defsymbol: 524
* defsymbol: (%0,%1)
* defsymbol: 179
* defsymbol: 161
*	export	_Create_Oper_Only
STARTFUNC(%0),(_Create_Oper_Only)
* sym() entry
* Create_Oper_Only (_Create_Oper_Only) type=pointer to char function(pointer to char,pointer to char,pointer to char,pointer to char) class=auto scope=GLOBAL ncalls=23
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188540, 188044
!_oper	equ	gen_temp_start+5
!_left	equ	gen_temp_start+9
!_right	equ	gen_temp_start+13
!_tail	equ	gen_temp_start+17
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Defpoint
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Jump
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Defpoint
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Jump
* Label
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Defpoint
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Label
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
ENDFUNC(%0),(_Create_Oper_Only)
FLUSH(),()
* defsymbol: temps
* defsymbol: Init_Temps
* defsymbol: memset
* defsymbol: 180
*	export	_Init_Temps
STARTFUNC(%0),(_Init_Temps)
* sym() entry
* Init_Temps (_Init_Temps) type=void function(void) class=auto scope=GLOBAL ncalls=1
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 0, 0
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Blockbeg
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Init_Temps)
FLUSH(),()
* defsymbol: temp_list
* defsymbol: Debug_Temps
* defsymbol: printf
* defsymbol: temp_list: head: %p
* defsymbol: 182
* defsymbol: temp_list: tail: %p
* defsymbol: 183
* defsymbol: 187
* defsymbol: 184
* defsymbol: temp_node: %p, prev: %p, next: %p, id: %d, num: %d
* defsymbol: 188
* defsymbol: 12
* defsymbol: 185
* defsymbol: 186
* defsymbol: 181
*	export	_Debug_Temps
STARTFUNC(%0),(_Debug_Temps)
* sym() entry
* Debug_Temps (_Debug_Temps) type=void function(pointer to struct TEMP_TAG) class=auto scope=GLOBAL ncalls=3
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188148, 188044
!_temp_list	equ	gen_temp_start+5
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Debug_Temps)
FLUSH(),()
* defsymbol: temp_list
* defsymbol: Clear_Temps
* defsymbol: memset
* defsymbol: 32
* defsymbol: 189
*	export	_Clear_Temps
STARTFUNC(%0),(_Clear_Temps)
* sym() entry
* Clear_Temps (_Clear_Temps) type=void function(pointer to struct TEMP_TAG) class=auto scope=GLOBAL ncalls=1
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188148, 188044
!_temp_list	equ	gen_temp_start+5
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Clear_Temps)
FLUSH(),()
* defsymbol: temp_list
* defsymbol: temp_id
* defsymbol: Alloc_Temp
* defsymbol: 191
* defsymbol: 195
* defsymbol: max
* defsymbol: 197
* defsymbol: fprintf
* defsymbol: 609
* defsymbol: 190
* defsymbol: 192
* defsymbol: 193
* defsymbol: printf
* defsymbol: Alloc_Temp(): Unable to allocate temporary
* defsymbol: 200
*	export	_Alloc_Temp
STARTFUNC(%0),(_Alloc_Temp)
* sym() entry
* Alloc_Temp (_Alloc_Temp) type=int function(pointer to struct TEMP_TAG,int) class=auto scope=GLOBAL ncalls=6
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188252, 188044
!_temp_list	equ	gen_temp_start+5
!_temp_id	equ	gen_temp_start+9
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Gen
* Blockbeg
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Defpoint
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Blockend
* Label
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Alloc_Temp)
FLUSH(),()
* defsymbol: temp_list
* defsymbol: temp_id
* defsymbol: Free_Temp
* defsymbol: 205
* defsymbol: 202
* defsymbol: 206
* defsymbol: 201
* defsymbol: 203
* defsymbol: 204
* defsymbol: printf
* defsymbol: Free_Temp(): Tried to free unallocated temp_id: %d
* defsymbol: 208
*	export	_Free_Temp
STARTFUNC(%0),(_Free_Temp)
* sym() entry
* Free_Temp (_Free_Temp) type=void function(pointer to struct TEMP_TAG,int) class=auto scope=GLOBAL ncalls=3
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188252, 188044
!_temp_list	equ	gen_temp_start+5
!_temp_id	equ	gen_temp_start+9
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Gen
* Blockbeg
* Defpoint
* Gen
* Jump
* Label
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Blockend
* Label
* Blockend
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Free_Temp)
FLUSH(),()
* defsymbol: temp_list
* defsymbol: Check_Free
* defsymbol: 211
* defsymbol: 210
* defsymbol: 212
* defsymbol: 209
*	export	_Check_Free
STARTFUNC(%0),(_Check_Free)
* sym() entry
* Check_Free (_Check_Free) type=int function(pointer to struct TEMP_TAG) class=auto scope=GLOBAL ncalls=1
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188148, 188044
!_temp_list	equ	gen_temp_start+5
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Jump
* Label
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
ENDFUNC(%0),(_Check_Free)
FLUSH(),()
* defsymbol: temp_list
* defsymbol: temp_id
* defsymbol: Get_Temp_Num
* defsymbol: 217
* defsymbol: 214
* defsymbol: 218
* defsymbol: 213
* defsymbol: 215
* defsymbol: 216
* defsymbol: printf
* defsymbol: Get_Temp_Num(): temp_id: %d was never allocated!
* defsymbol: 220
*	export	_Get_Temp_Num
STARTFUNC(%0),(_Get_Temp_Num)
* sym() entry
* Get_Temp_Num (_Get_Temp_Num) type=int function(pointer to struct TEMP_TAG,int) class=auto scope=GLOBAL ncalls=2
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188252, 188044
!_temp_list	equ	gen_temp_start+5
!_temp_id	equ	gen_temp_start+9
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Gen
* Blockbeg
* Defpoint
* Gen
* Jump
* Label
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Blockend
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Get_Temp_Num)
FLUSH(),()
* defsymbol: output_lines
* defsymbol: Init_Output
* defsymbol: 0
* defsymbol: 221
*	export	_Init_Output
STARTFUNC(%0),(_Init_Output)
* sym() entry
* Init_Output (_Init_Output) type=void function(void) class=auto scope=GLOBAL
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 0, 0
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Init_Output)
FLUSH(),()
* defsymbol: text
* defsymbol: Add_Output_Buffer
* defsymbol: 228
* defsymbol: fprintf
* defsymbol: 727
* defsymbol: 227
*	export	_Add_Output_Buffer
STARTFUNC(%0),(_Add_Output_Buffer)
* sym() entry
* Add_Output_Buffer (_Add_Output_Buffer) type=void function(pointer to char) class=auto scope=GLOBAL ncalls=5
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188148, 188044
!_text	equ	gen_temp_start+5
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Defpoint
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Add_Output_Buffer)
FLUSH(),()
* defsymbol: special
* defsymbol: outfile
* defsymbol: Output_Special
* defsymbol: marktemps
* defsymbol: 236
* defsymbol: 9
* defsymbol: 234
* defsymbol: 240
* defsymbol: 237
* defsymbol: fprintf
* defsymbol: dag_temp%d	equ	dag_temp_start+%d
* defsymbol: 241
* defsymbol: 238
* defsymbol: 239
* defsymbol: fprintf
* defsymbol: gen_temp_start	equ	dag_temp_start+%d
* defsymbol: 242
* defsymbol: 233
*	export	_Output_Special
STARTFUNC(%0),(_Output_Special)
* sym() entry
* Output_Special (_Output_Special) type=int function(pointer to char,pointer to struct _iobuf) class=auto scope=GLOBAL ncalls=3
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188276, 188044
!_special	equ	gen_temp_start+5
!_outfile	equ	gen_temp_start+9
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Defpoint
* Gen
* Jump
* Label
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Blockend
* Label
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
ENDFUNC(%0),(_Output_Special)
FLUSH(),()
* defsymbol: outfile
* defsymbol: Flush_Output_Buffer
* defsymbol: 247
* defsymbol: 244
* defsymbol: 38
* defsymbol: 250
* defsymbol: 251
* defsymbol: 252
* defsymbol: fputs
* defsymbol: _flsbuf
* defsymbol: 257
* defsymbol: 13
* defsymbol: 258
* defsymbol: 259
* defsymbol: 13
* defsymbol: 261
* defsymbol: 262
* defsymbol: 260
* defsymbol: 245
* defsymbol: 246
* defsymbol: 243
*	export	_Flush_Output_Buffer
STARTFUNC(%0),(_Flush_Output_Buffer)
* sym() entry
* Flush_Output_Buffer (_Flush_Output_Buffer) type=void function(pointer to struct _iobuf) class=auto scope=GLOBAL ncalls=6
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188148, 188044
!_outfile	equ	gen_temp_start+5
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Jump
* Label
* Blockbeg
* Defpoint
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Flush_Output_Buffer)
FLUSH(),()
* defsymbol: dag
* defsymbol: Output_Dag_Recursive
* defsymbol: string
* defsymbol: value
* defsymbol: length
* defsymbol: Get_Number
* defsymbol: 268
* defsymbol: 267
* defsymbol: 271
* defsymbol: 269
* defsymbol: 45
* defsymbol: 272
* defsymbol: 277
* defsymbol: 274
* defsymbol: 10
* defsymbol: 48
* defsymbol: 275
* defsymbol: 276
* defsymbol: 279
* defsymbol: 266
*	export	_Get_Number
STARTFUNC(%0),(_Get_Number)
* sym() entry
* Get_Number (_Get_Number) type=int function(pointer to char,pointer to int,pointer to int) class=auto scope=GLOBAL
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188388, 188044
!_string	equ	gen_temp_start+5
!_value	equ	gen_temp_start+9
!_length	equ	gen_temp_start+13
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Gen
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Gen
* Jump
* Label
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
ENDFUNC(%0),(_Get_Number)
FLUSH(),()
* defsymbol: dag
* defsymbol: arg_num
* defsymbol: Get_Variable_Name
* defsymbol: 285
* defsymbol: 282
* defsymbol: 286
* defsymbol: printf
* defsymbol: Get_Variable_Name(): tried to access arg %d of %s
* defsymbol: 288
* defsymbol: 289
* defsymbol: fprintf
* defsymbol: 857
* defsymbol: 283
* defsymbol: 284
* defsymbol: 292
* defsymbol: printf
* defsymbol: Get_Variable_Name(): invalid variable!
* defsymbol: 294
* defsymbol: 281
*	export	_Get_Variable_Name
STARTFUNC(%0),(_Get_Variable_Name)
* sym() entry
* Get_Variable_Name (_Get_Variable_Name) type=pointer to char function(pointer to char,int) class=auto scope=GLOBAL ncalls=8
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188276, 188044
!_dag	equ	gen_temp_start+5
!_arg_num	equ	gen_temp_start+9
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Gen
* Blockbeg
* Defpoint
* Gen
* Jump
* Label
* Blockbeg
* Defpoint
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Defpoint
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
ENDFUNC(%0),(_Get_Variable_Name)
FLUSH(),()
* defsymbol: dag
* defsymbol: line
* defsymbol: left
* defsymbol: right
* defsymbol: temp_list
* defsymbol: Output_Special_Line
* defsymbol: buffer
* segment()
!	end
!-1	data
* sym() entry
* buffer (_buffer) type=array 256 of char class=static scope=LOCAL
!_buffer	entry
!	ds	256
* defsymbol: 296
* defsymbol: fprintf
* defsymbol: 882
* defsymbol: left
* defsymbol: 301
* defsymbol: 299
* defsymbol: 302
* defsymbol: fprintf
* defsymbol: 887
* defsymbol: 300
* defsymbol: right
* defsymbol: 307
* defsymbol: 305
* defsymbol: 308
* defsymbol: fprintf
* defsymbol: 891
* defsymbol: 306
* defsymbol: label
* defsymbol: 313
* defsymbol: 311
* defsymbol: 312
* defsymbol: arg
* defsymbol: 316
* defsymbol: 3
* defsymbol: 314
* defsymbol: 315
* defsymbol: alloctemp
* defsymbol: 319
* defsymbol: 317
* defsymbol: 318
* defsymbol: freetemp
* defsymbol: 322
* defsymbol: 320
* defsymbol: 321
* defsymbol: temp
* defsymbol: 325
* defsymbol: 323
* defsymbol: dag_temp%d
* defsymbol: 326
* defsymbol: 324
* defsymbol: flush
* defsymbol: 329
* defsymbol: 327
* defsymbol: 328
* defsymbol: pushstack
* defsymbol: 332
* defsymbol: 330
* defsymbol: 333
* defsymbol: 331
* defsymbol: clearstack
* defsymbol: 337
* defsymbol: 335
* defsymbol: 336
* defsymbol: stack_depth
* defsymbol: 340
* defsymbol: 338
* defsymbol: %d
* defsymbol: 341
* defsymbol: 339
* defsymbol: fixstack0
* defsymbol: 344
* defsymbol: 342
* defsymbol: 345
* defsymbol: 	tsc	clc	adc	#%d	tcs
* defsymbol: 347
* defsymbol: 343
* defsymbol: fixstack1
* defsymbol: 350
* defsymbol: 348
* defsymbol: 351
* defsymbol: 	tay	tsc	clc	adc	#%d	tcs	tya
* defsymbol: 353
* defsymbol: 354
* defsymbol: 355
* defsymbol: 356
* defsymbol: 295
* segment()
!	end
*	export	_Output_Special_Line
STARTFUNC(%0),(_Output_Special_Line)
* sym() entry
* Output_Special_Line (_Output_Special_Line) type=void function(pointer to char,pointer to char,pointer to char,pointer to char,pointer to struct TEMP_TAG) class=auto scope=GLOBAL ncalls=51
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188628, 188044
!_dag	equ	gen_temp_start+5
!_line	equ	gen_temp_start+9
!_left	equ	gen_temp_start+13
!_right	equ	gen_temp_start+17
!_temp_list	equ	gen_temp_start+21
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Defpoint
* Defpoint
* Defpoint
* Gen
* Blockbeg
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Defpoint
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Jump
* Label
* Defpoint
* Gen
* Blockbeg
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Defpoint
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Jump
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Defpoint
* Gen
* Blockend
* Jump
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Defpoint
* Gen
* Blockend
* Jump
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Jump
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Jump
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Defpoint
* Gen
* Blockend
* Jump
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Jump
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Label
* Defpoint
* Defpoint
* Gen
* Blockend
* Jump
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Defpoint
* Gen
* Blockend
* Jump
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Defpoint
* Gen
* Blockend
* Jump
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Gen
* Blockend
* Jump
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Gen
* Blockend
* Label
* Label
* Label
* Label
* Label
* Label
* Label
* Label
* Label
* Label
* Label
* Label
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Label
* Label
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Output_Special_Line)
FLUSH(),()
* defsymbol: dag
* defsymbol: output
* defsymbol: left
* defsymbol: right
* defsymbol: Output_Line
* defsymbol: 257
* defsymbol: 364
* defsymbol: fprintf
* defsymbol: 984
* defsymbol: 370
* defsymbol: 367
* defsymbol: 371
* defsymbol: 372
* defsymbol: 373
* defsymbol: 374
* defsymbol: 368
* defsymbol: 369
* defsymbol: 375
* defsymbol: fprintf
* defsymbol: *** WARNING: MD did not properly deallocate temporaries!
* defsymbol: 378
* defsymbol:   dag: %s
* defsymbol: 380
* defsymbol: 358
*	export	_Output_Line
STARTFUNC(%0),(_Output_Line)
* sym() entry
* Output_Line (_Output_Line) type=void function(pointer to char,pointer to char,pointer to char,pointer to char) class=auto scope=GLOBAL ncalls=14
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188516, 188044
!_dag	equ	gen_temp_start+5
!_output	equ	gen_temp_start+9
!_left	equ	gen_temp_start+13
!_right	equ	gen_temp_start+17
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Gen
* Gen
* Blockbeg
* Defpoint
* Address
* Address
* Gen
* Defpoint
* Address
* Address
* Gen
* Defpoint
* Address
* Gen
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Defpoint
* Defpoint
* Gen
* Jump
* Label
* Blockbeg
* Defpoint
* Defpoint
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Jump
* Label
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Output_Line)
FLUSH(),()
* defsymbol: dag
* defsymbol: Output_Dag_Recursive
* defsymbol: 382
* defsymbol: 381
* defsymbol: printf
* defsymbol: ;   oper: %s (%d)
* defsymbol: 384
* defsymbol: ;   left: %s (%d)
* defsymbol: 385
* defsymbol: 386
* defsymbol: ;  right: %s (%d)
* defsymbol: 388
* defsymbol: 389
* defsymbol: ;   tail: %s (%d)
* defsymbol: 391
* defsymbol: 392
* defsymbol: (
* defsymbol: 394
* defsymbol: ,%x)
* defsymbol: 395
* defsymbol: ; trying oper+left: %s
* defsymbol: 396
* defsymbol: 397
* defsymbol: ;    found it!
* defsymbol: 399
* defsymbol: 400
* defsymbol: (%x,
* defsymbol: 401
* defsymbol: ; trying oper+right: %s
* defsymbol: 402
* defsymbol: 403
* defsymbol: ;   found it!
* defsymbol: 405
* defsymbol: ; trying oper only: %s
* defsymbol: 406
* defsymbol: 407
* defsymbol: fprintf
* defsymbol: ; *** ERROR! COULDN'T FIND ATOMIC DAG %s!!!
* defsymbol: 410
* defsymbol: 408
*	export	_Output_Dag_Recursive
STARTFUNC(%0),(_Output_Dag_Recursive)
* sym() entry
* Output_Dag_Recursive (_Output_Dag_Recursive) type=void function(pointer to char) class=auto scope=GLOBAL ncalls=35
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188148, 188044
!_dag	equ	gen_temp_start+5
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Blockend
* Label
* Defpoint
* Gen
* Defpoint
* Defpoint
* Defpoint
* Defpoint
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Defpoint
* Gen
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Jump
* Blockend
* Label
* Defpoint
* Gen
* Defpoint
* Defpoint
* Gen
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Jump
* Blockend
* Label
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Defpoint
* Gen
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Jump
* Blockend
* Label
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Output_Dag_Recursive)
FLUSH(),()
* defsymbol: dag
* defsymbol: Output_Dag
* defsymbol: 414
* defsymbol: 412
* defsymbol: 411
* defsymbol: printf
* defsymbol: ; verbatim dag: %s 
* defsymbol: 415
* defsymbol: 416
* defsymbol: (found!)
* defsymbol: 418
* defsymbol: (not found)
* defsymbol: 419
* defsymbol: 417
*	export	_Output_Dag
STARTFUNC(%0),(_Output_Dag)
* sym() entry
* Output_Dag (_Output_Dag) type=void function(pointer to char) class=auto scope=GLOBAL ncalls=6
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188148, 188044
!_dag	equ	gen_temp_start+5
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Defpoint
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Blockend
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Output_Dag)
FLUSH(),()
* defsymbol: string
* defsymbol: dag
* defsymbol: vars
* defsymbol: dag_length
* defsymbol: vars_length
* defsymbol: Split_Program_Line
* defsymbol: 424
* defsymbol: 421
* defsymbol: 425
* defsymbol: 426
* defsymbol: 427
* defsymbol: 428
* defsymbol: 429
* defsymbol: 422
* defsymbol: 423
* defsymbol: 420
*	export	_Split_Program_Line
STARTFUNC(%0),(_Split_Program_Line)
* sym() entry
* Split_Program_Line (_Split_Program_Line) type=void function(pointer to char,pointer to pointer to char,pointer to pointer to char,pointer to int,pointer to int) class=auto scope=GLOBAL ncalls=1
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188676, 188044
!_string	equ	gen_temp_start+5
!_dag	equ	gen_temp_start+9
!_vars	equ	gen_temp_start+13
!_dag_length	equ	gen_temp_start+17
!_vars_length	equ	gen_temp_start+21
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Defpoint
* Gen
* Jump
* Label
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Label
* Label
* Label
* Blockend
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Split_Program_Line)
FLUSH(),()
* defsymbol: vars_buffer
* defsymbol: Separate_Variables
* defsymbol: 432
* defsymbol: 431
* defsymbol: 434
* defsymbol: printf
* defsymbol: Separate_Variables(): failed on string: %s
* defsymbol: 436
* defsymbol: memset
* defsymbol: 437
* defsymbol: 441
* defsymbol: 442
* defsymbol: 443
* defsymbol: 439
* defsymbol: 438
* defsymbol: 445
* defsymbol: 449
* defsymbol: 447
* defsymbol: printf
* defsymbol: ;   var %d: %s
* defsymbol: 451
* defsymbol: 450
* defsymbol: 446
*	export	_Separate_Variables
STARTFUNC(%0),(_Separate_Variables)
* sym() entry
* Separate_Variables (_Separate_Variables) type=void function(pointer to char) class=auto scope=GLOBAL ncalls=7
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188148, 188044
!_vars_buffer	equ	gen_temp_start+5
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Jump
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Label
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Jump
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Blockend
* Blockend
* Defpoint
* Defpoint
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Jump
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Label
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Separate_Variables)
FLUSH(),()
* defsymbol: filename
* defsymbol: Read_Program_File
* defsymbol: 453
* defsymbol: fprintf
* defsymbol: 1219
* defsymbol: 456
* defsymbol: fprintf
* defsymbol: 1222
* defsymbol: 459
* defsymbol: fprintf
* defsymbol: 1225
* defsymbol: 462
* defsymbol: printf
* defsymbol: Read_Program_File(): Unable to open program file
* defsymbol: 464
* defsymbol: 466
* defsymbol: 465
* defsymbol: 468
* defsymbol: 470
* defsymbol: 42
* defsymbol: 472
* defsymbol: 474
* defsymbol: 33
* defsymbol: 475
* defsymbol: ; %s
* defsymbol: 477
* defsymbol: printf
* defsymbol: ;     dag: %s
* defsymbol: 478
* defsymbol: ;    vars: %s
* defsymbol: 479
* defsymbol: 467
* defsymbol: fclose
* defsymbol: 452
*	export	_Read_Program_File
STARTFUNC(%0),(_Read_Program_File)
* sym() entry
* Read_Program_File (_Read_Program_File) type=void function(pointer to char) class=auto scope=GLOBAL ncalls=29
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188148, 188044
!_filename	equ	gen_temp_start+5
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Defpoint
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Defpoint
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Defpoint
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Gen
* Jump
* Label
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Jump
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Jump
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Jump
* Blockend
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_Read_Program_File)
FLUSH(),()
* defsymbol: argc
* defsymbol: argv
* defsymbol: main
* defsymbol: 481
* defsymbol: printf
* defsymbol: usage: dag2gs2 <input file> <output file>
* defsymbol: 483
* defsymbol:  input file: lcc output .dag file
* defsymbol: 484
* defsymbol: output file: ORCA/M .asm file
* defsymbol: 485
* defsymbol: 489
* defsymbol: 486
* defsymbol: -O
* defsymbol: 492
* defsymbol: 490
* defsymbol: 495
* defsymbol: 493
* defsymbol: printf
* defsymbol: Invalid optimization level: %d
* defsymbol: 496
* defsymbol: 487
* defsymbol: 488
* defsymbol: 497
* defsymbol: opt0.dag
* defsymbol: 499
* defsymbol: 500
* defsymbol: opt1.dag
* defsymbol: 502
* defsymbol: wt
* defsymbol: 505
* defsymbol: 503
* defsymbol: printf
* defsymbol: Error: couldn't open output file
* defsymbol: 506
* defsymbol: setvbuf
* defsymbol: 32768
* defsymbol: printf
* defsymbol: Input file: %s
* defsymbol: 507
* defsymbol: fclose
* defsymbol: 480
*	export	_main
STARTFUNC(%0),(_main)
* sym() entry
* main (_main) type=void function(int,pointer to pointer to char) class=auto scope=GLOBAL ncalls=22
************************** PASS 1 **************************
!dag_temp_start	equ	1
!	&marktemps
* temps_used: 0
!local	equ	gen_temp_start+-1
* retaddr at: 0
*  old dp at: 3
* parms: 188276, 188020
!_argc	equ	gen_temp_start+5
!_argv	equ	gen_temp_start+9
LINK(),()
************************** PASS 2 **************************
* Start
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Defpoint
* Gen
* Jump
* Label
* Blockbeg
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Blockend
* Label
* Blockend
* Label
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Label
* Defpoint
* Gen
* Blockbeg
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Label
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Defpoint
* Gen
* Blockend
* Gen
* Jump
* Label
* Defpoint
ENDFUNC(%0),(_main)
FLUSH(),()
* segment()
!	end
!-2	data
*	export	_output_lines
* sym() entry
* output_lines (_output_lines) type=array 2 of struct LINE_TAG class=auto scope=GLOBAL
!_output_lines	entry
!	ds	24
*	export	_temps
* sym() entry
* temps (_temps) type=array 256 of int class=auto scope=GLOBAL
!_temps	entry
!	ds	1024
*	export	_last_temp
* sym() entry
* last_temp (_last_temp) type=int class=auto scope=GLOBAL
!_last_temp	entry
!	ds	4
*	export	_outfile
* sym() entry
* outfile (_outfile) type=pointer to struct _iobuf class=auto scope=GLOBAL
!_outfile	entry
!	ds	4
*	export	_huge_buffer
* sym() entry
* huge_buffer (_huge_buffer) type=array 8192 of char class=auto scope=GLOBAL
!_huge_buffer	entry
!	ds	8192
*	export	_vars
* sym() entry
* vars (_vars) type=array 256 of pointer to char class=auto scope=GLOBAL
!_vars	entry
!	ds	1024
*	export	_generic_buffer
* sym() entry
* generic_buffer (_generic_buffer) type=pointer to char class=auto scope=GLOBAL
!_generic_buffer	entry
!	ds	4
*	export	_dags
* sym() entry
* dags (_dags) type=array 256 of pointer to struct DAG_STRUCT_TAG class=auto scope=GLOBAL
!_dags	entry
!	ds	1024
*	import _strtok
*	import _strstr
*	import _strspn
*	import _strrchr
*	import _strpbrk
*	import _strncpy
*	import _strncmp
*	import _strncat
*	import _strlen
*	import _strdup
*	import _strcspn
*	import _strcpy
*	import _strcmp
*	import _strchr
*	import _strcat
*	import _wcstombs
*	import _mbstowcs
*	import _wctomb
*	import _mbtowc
*	import _srand
*	import _realloc
*	import _rand
*	import _qsort
*	import _malloc
*	import _getenv
*	import _free
*	import _exit
*	import _calloc
*	import _bsearch
*	import _atol
*	import _atoi
*	import _atof
*	import _abs
*	import _abort
*	import __mb_cur_max
*	import _tmpnam
*	import _tempnam
*	import _cuserid
*	import _ctermid
*	import _sprintf
*	import _gets
*	import _fgets
*	import _ftell
*	import _tmpfile
*	import _popen
*	import _freopen
*	import _fdopen
*	import _fopen
*	import __iob
*	import __ctype_
* defsymbol: setvbuf
*	import _setvbuf
* defsymbol: _flsbuf
*	import __flsbuf
* defsymbol: fputs
*	import _fputs
* defsymbol: max
*	import _max
* defsymbol: fclose
*	import _fclose
* defsymbol: printf
*	import _printf
* defsymbol: memset
*	import _memset
* defsymbol: fprintf
*	import _fprintf
* segment()
* sym() entry
* 507 (L507) type=array 16 of char class=static scope=GLOBAL
!L507	entry
!	dc	i1'73,110,112,117,116,32,102,105,108,101,58,32,37,115,13,0'
'
* sym() entry
* 506 (L506) type=array 34 of char class=static scope=GLOBAL
!L506	entry
!	dc	i1'69,114,114,111,114,58,32,99,111,117,108,100,110,39,116,32'
!	dc	i1'111,112,101,110,32,111,117,116,112,117,116,32,102,105,108,101'
!	dc	i1'13,0'
* sym() entry
* 505 (L505) type=array 3 of char class=static scope=GLOBAL
!L505	entry
!	dc	i1'119,116,0'
* sym() entry
* 502 (L502) type=array 9 of char class=static scope=GLOBAL
!L502	entry
!	dc	i1'111,112,116,49,46,100,97,103,0'
* sym() entry
* 499 (L499) type=array 9 of char class=static scope=GLOBAL
!L499	entry
!	dc	i1'111,112,116,48,46,100,97,103,0'
* sym() entry
* 496 (L496) type=array 32 of char class=static scope=GLOBAL
!L496	entry
!	dc	i1'73,110,118,97,108,105,100,32,111,112,116,105,109,105,122,97'
!	dc	i1'116,105,111,110,32,108,101,118,101,108,58,32,37,100,13,0'
'
* sym() entry
* 492 (L492) type=array 3 of char class=static scope=GLOBAL
!L492	entry
!	dc	i1'45,79,0'
* sym() entry
* 485 (L485) type=array 31 of char class=static scope=GLOBAL
!L485	entry
!	dc	i1'111,117,116,112,117,116,32,102,105,108,101,58,32,79,82,67'
!	dc	i1'65,47,77,32,46,97,115,109,32,102,105,108,101,13,0'
* sym() entry
* 484 (L484) type=array 35 of char class=static scope=GLOBAL
!L484	entry
!	dc	i1'32,105,110,112,117,116,32,102,105,108,101,58,32,108,99,99'
!	dc	i1'32,111,117,116,112,117,116,32,46,100,97,103,32,102,105,108'
!	dc	i1'101,13,0'
* sym() entry
* 483 (L483) type=array 43 of char class=static scope=GLOBAL
!L483	entry
!	dc	i1'117,115,97,103,101,58,32,100,97,103,50,103,115,50,32,60'
!	dc	i1'105,110,112,117,116,32,102,105,108,101,62,32,60,111,117,116'
!	dc	i1'112,117,116,32,102,105,108,101,62,13,0'
* sym() entry
* 479 (L479) type=array 15 of char class=static scope=GLOBAL
!L479	entry
!	dc	i1'59,32,32,32,32,118,97,114,115,58,32,37,115,13,0'
* sym() entry
* 478 (L478) type=array 15 of char class=static scope=GLOBAL
!L478	entry
!	dc	i1'59,32,32,32,32,32,100,97,103,58,32,37,115,13,0'
* sym() entry
* 477 (L477) type=array 5 of char class=static scope=GLOBAL
!L477	entry
!	dc	i1'59,32,37,115,0'
* sym() entry
* 464 (L464) type=array 50 of char class=static scope=GLOBAL
!L464	entry
!	dc	i1'82,101,97,100,95,80,114,111,103,114,97,109,95,70,105,108'
!	dc	i1'101,40,41,58,32,85,110,97,98,108,101,32,116,111,32,111'
!	dc	i1'112,101,110,32,112,114,111,103,114,97,109,32,102,105,108,101'
!	dc	i1'13,0'
* sym() entry
* 451 (L451) type=array 16 of char class=static scope=GLOBAL
!L451	entry
!	dc	i1'59,32,32,32,118,97,114,32,37,100,58,32,37,115,13,0'
'
* sym() entry
* 436 (L436) type=array 44 of char class=static scope=GLOBAL
!L436	entry
!	dc	i1'83,101,112,97,114,97,116,101,95,86,97,114,105,97,98,108'
!	dc	i1'101,115,40,41,58,32,102,97,105,108,101,100,32,111,110,32'
!	dc	i1'115,116,114,105,110,103,58,32,37,115,13,0'
* sym() entry
* 419 (L419) type=array 13 of char class=static scope=GLOBAL
!L419	entry
!	dc	i1'40,110,111,116,32,102,111,117,110,100,41,13,0'
* sym() entry
* 418 (L418) type=array 10 of char class=static scope=GLOBAL
!L418	entry
!	dc	i1'40,102,111,117,110,100,33,41,13,0'
* sym() entry
* 415 (L415) type=array 20 of char class=static scope=GLOBAL
!L415	entry
!	dc	i1'59,32,118,101,114,98,97,116,105,109,32,100,97,103,58,32'
!	dc	i1'37,115,32,0'
* sym() entry
* 410 (L410) type=array 45 of char class=static scope=GLOBAL
!L410	entry
!	dc	i1'59,32,42,42,42,32,69,82,82,79,82,33,32,67,79,85'
!	dc	i1'76,68,78,39,84,32,70,73,78,68,32,65,84,79,77,73'
!	dc	i1'67,32,68,65,71,32,37,115,33,33,33,13,0'
* sym() entry
* 406 (L406) type=array 24 of char class=static scope=GLOBAL
!L406	entry
!	dc	i1'59,32,116,114,121,105,110,103,32,111,112,101,114,32,111,110'
!	dc	i1'108,121,58,32,37,115,13,0'
* sym() entry
* 405 (L405) type=array 15 of char class=static scope=GLOBAL
!L405	entry
!	dc	i1'59,32,32,32,102,111,117,110,100,32,105,116,33,13,0'
* sym() entry
* 402 (L402) type=array 25 of char class=static scope=GLOBAL
!L402	entry
!	dc	i1'59,32,116,114,121,105,110,103,32,111,112,101,114,43,114,105'
!	dc	i1'103,104,116,58,32,37,115,13,0'
* sym() entry
* 401 (L401) type=array 5 of char class=static scope=GLOBAL
!L401	entry
!	dc	i1'40,37,120,44,0'
* sym() entry
* 399 (L399) type=array 16 of char class=static scope=GLOBAL
!L399	entry
!	dc	i1'59,32,32,32,32,102,111,117,110,100,32,105,116,33,13,0'
'
* sym() entry
* 396 (L396) type=array 24 of char class=static scope=GLOBAL
!L396	entry
!	dc	i1'59,32,116,114,121,105,110,103,32,111,112,101,114,43,108,101'
!	dc	i1'102,116,58,32,37,115,13,0'
* sym() entry
* 395 (L395) type=array 5 of char class=static scope=GLOBAL
!L395	entry
!	dc	i1'44,37,120,41,0'
* sym() entry
* 394 (L394) type=array 2 of char class=static scope=GLOBAL
!L394	entry
!	dc	i1'40,0'
* sym() entry
* 391 (L391) type=array 19 of char class=static scope=GLOBAL
!L391	entry
!	dc	i1'59,32,32,32,116,97,105,108,58,32,37,115,32,40,37,100'
!	dc	i1'41,13,0'
* sym() entry
* 388 (L388) type=array 19 of char class=static scope=GLOBAL
!L388	entry
!	dc	i1'59,32,32,114,105,103,104,116,58,32,37,115,32,40,37,100'
!	dc	i1'41,13,0'
* sym() entry
* 385 (L385) type=array 19 of char class=static scope=GLOBAL
!L385	entry
!	dc	i1'59,32,32,32,108,101,102,116,58,32,37,115,32,40,37,100'
!	dc	i1'41,13,0'
* sym() entry
* 384 (L384) type=array 19 of char class=static scope=GLOBAL
!L384	entry
!	dc	i1'59,32,32,32,111,112,101,114,58,32,37,115,32,40,37,100'
!	dc	i1'41,13,0'
* sym() entry
* 380 (L380) type=array 11 of char class=static scope=GLOBAL
!L380	entry
!	dc	i1'32,32,100,97,103,58,32,37,115,13,0'
* sym() entry
* 378 (L378) type=array 58 of char class=static scope=GLOBAL
!L378	entry
!	dc	i1'42,42,42,32,87,65,82,78,73,78,71,58,32,77,68,32'
!	dc	i1'100,105,100,32,110,111,116,32,112,114,111,112,101,114,108,121'
!	dc	i1'32,100,101,97,108,108,111,99,97,116,101,32,116,101,109,112'
!	dc	i1'111,114,97,114,105,101,115,33,13,0'
* sym() entry
* 353 (L353) type=array 34 of char class=static scope=GLOBAL
!L353	entry
!	dc	i1'9,116,97,121,13,9,116,115,99,13,9,99,108,99,13,9'
!	dc	i1'97,100,99,9,35,37,100,13,9,116,99,115,13,9,116,121'
!	dc	i1'97,0'
* sym() entry
* 350 (L350) type=array 10 of char class=static scope=GLOBAL
!L350	entry
!	dc	i1'102,105,120,115,116,97,99,107,49,0'
* sym() entry
* 347 (L347) type=array 24 of char class=static scope=GLOBAL
!L347	entry
!	dc	i1'9,116,115,99,13,9,99,108,99,13,9,97,100,99,9,35'
!	dc	i1'37,100,13,9,116,99,115,0'
* sym() entry
* 344 (L344) type=array 10 of char class=static scope=GLOBAL
!L344	entry
!	dc	i1'102,105,120,115,116,97,99,107,48,0'
* sym() entry
* 341 (L341) type=array 3 of char class=static scope=GLOBAL
!L341	entry
!	dc	i1'37,100,0'
* sym() entry
* 340 (L340) type=array 12 of char class=static scope=GLOBAL
!L340	entry
!	dc	i1'115,116,97,99,107,95,100,101,112,116,104,0'
* sym() entry
* 337 (L337) type=array 11 of char class=static scope=GLOBAL
!L337	entry
!	dc	i1'99,108,101,97,114,115,116,97,99,107,0'
* sym() entry
* 332 (L332) type=array 10 of char class=static scope=GLOBAL
!L332	entry
!	dc	i1'112,117,115,104,115,116,97,99,107,0'
* sym() entry
* 329 (L329) type=array 6 of char class=static scope=GLOBAL
!L329	entry
!	dc	i1'102,108,117,115,104,0'
* sym() entry
* 326 (L326) type=array 11 of char class=static scope=GLOBAL
!L326	entry
!	dc	i1'100,97,103,95,116,101,109,112,37,100,0'
* sym() entry
* 325 (L325) type=array 5 of char class=static scope=GLOBAL
!L325	entry
!	dc	i1'116,101,109,112,0'
* sym() entry
* 322 (L322) type=array 9 of char class=static scope=GLOBAL
!L322	entry
!	dc	i1'102,114,101,101,116,101,109,112,0'
* sym() entry
* 319 (L319) type=array 10 of char class=static scope=GLOBAL
!L319	entry
!	dc	i1'97,108,108,111,99,116,101,109,112,0'
* sym() entry
* 316 (L316) type=array 4 of char class=static scope=GLOBAL
!L316	entry
!	dc	i1'97,114,103,0'
* sym() entry
* 313 (L313) type=array 6 of char class=static scope=GLOBAL
!L313	entry
!	dc	i1'108,97,98,101,108,0'
* sym() entry
* 307 (L307) type=array 6 of char class=static scope=GLOBAL
!L307	entry
!	dc	i1'114,105,103,104,116,0'
* sym() entry
* 301 (L301) type=array 5 of char class=static scope=GLOBAL
!L301	entry
!	dc	i1'108,101,102,116,0'
* sym() entry
* 294 (L294) type=array 40 of char class=static scope=GLOBAL
!L294	entry
!	dc	i1'71,101,116,95,86,97,114,105,97,98,108,101,95,78,97,109'
!	dc	i1'101,40,41,58,32,105,110,118,97,108,105,100,32,118,97,114'
!	dc	i1'105,97,98,108,101,33,13,0'
* sym() entry
* 288 (L288) type=array 51 of char class=static scope=GLOBAL
!L288	entry
!	dc	i1'71,101,116,95,86,97,114,105,97,98,108,101,95,78,97,109'
!	dc	i1'101,40,41,58,32,116,114,105,101,100,32,116,111,32,97,99'
!	dc	i1'99,101,115,115,32,97,114,103,32,37,100,32,111,102,32,37'
!	dc	i1'115,13,0'
* sym() entry
* 242 (L242) type=array 38 of char class=static scope=GLOBAL
!L242	entry
!	dc	i1'103,101,110,95,116,101,109,112,95,115,116,97,114,116,9,101'
!	dc	i1'113,117,9,100,97,103,95,116,101,109,112,95,115,116,97,114'
!	dc	i1'116,43,37,100,13,0'
* sym() entry
* 241 (L241) type=array 34 of char class=static scope=GLOBAL
!L241	entry
!	dc	i1'100,97,103,95,116,101,109,112,37,100,9,101,113,117,9,100'
!	dc	i1'97,103,95,116,101,109,112,95,115,116,97,114,116,43,37,100'
!	dc	i1'13,0'
* sym() entry
* 236 (L236) type=array 10 of char class=static scope=GLOBAL
!L236	entry
!	dc	i1'109,97,114,107,116,101,109,112,115,0'
* sym() entry
* 220 (L220) type=array 50 of char class=static scope=GLOBAL
!L220	entry
!	dc	i1'71,101,116,95,84,101,109,112,95,78,117,109,40,41,58,32'
!	dc	i1'116,101,109,112,95,105,100,58,32,37,100,32,119,97,115,32'
!	dc	i1'110,101,118,101,114,32,97,108,108,111,99,97,116,101,100,33'
!	dc	i1'13,0'
* sym() entry
* 208 (L208) type=array 52 of char class=static scope=GLOBAL
!L208	entry
!	dc	i1'70,114,101,101,95,84,101,109,112,40,41,58,32,84,114,105'
!	dc	i1'101,100,32,116,111,32,102,114,101,101,32,117,110,97,108,108'
!	dc	i1'111,99,97,116,101,100,32,116,101,109,112,95,105,100,58,32'
!	dc	i1'37,100,13,0'
* sym() entry
* 200 (L200) type=array 44 of char class=static scope=GLOBAL
!L200	entry
!	dc	i1'65,108,108,111,99,95,84,101,109,112,40,41,58,32,85,110'
!	dc	i1'97,98,108,101,32,116,111,32,97,108,108,111,99,97,116,101'
!	dc	i1'32,116,101,109,112,111,114,97,114,121,13,0'
* sym() entry
* 188 (L188) type=array 52 of char class=static scope=GLOBAL
!L188	entry
!	dc	i1'116,101,109,112,95,110,111,100,101,58,32,37,112,44,32,112'
!	dc	i1'114,101,118,58,32,37,112,44,32,110,101,120,116,58,32,37'
!	dc	i1'112,44,32,105,100,58,32,37,100,44,32,110,117,109,58,32'
!	dc	i1'37,100,13,0'
* sym() entry
* 183 (L183) type=array 21 of char class=static scope=GLOBAL
!L183	entry
!	dc	i1'116,101,109,112,95,108,105,115,116,58,32,116,97,105,108,58'
!	dc	i1'32,37,112,13,0'
* sym() entry
* 182 (L182) type=array 21 of char class=static scope=GLOBAL
!L182	entry
!	dc	i1'116,101,109,112,95,108,105,115,116,58,32,104,101,97,100,58'
!	dc	i1'32,37,112,13,0'
* sym() entry
* 179 (L179) type=array 8 of char class=static scope=GLOBAL
!L179	entry
!	dc	i1'40,37,48,44,37,49,41,0'
* sym() entry
* 175 (L175) type=array 2 of char class=static scope=GLOBAL
!L175	entry
!	dc	i1'41,0'
* sym() entry
* 174 (L174) type=array 8 of char class=static scope=GLOBAL
!L174	entry
!	dc	i1'40,37,48,44,37,49,44,0'
* sym() entry
* 168 (L168) type=array 5 of char class=static scope=GLOBAL
!L168	entry
!	dc	i1'40,37,48,41,0'
* sym() entry
* 89 (L89) type=array 2 of char class=static scope=GLOBAL
!L89	entry
!	dc	i1'13,0'
* sym() entry
* 80 (L80) type=array 42 of char class=static scope=GLOBAL
!L80	entry
!	dc	i1'82,101,97,100,95,68,65,71,95,70,105,108,101,40,41,58'
!	dc	i1'32,85,110,97,98,108,101,32,116,111,32,111,112,101,110,32'
!	dc	i1'100,97,103,32,102,105,108,101,13,0'
* sym() entry
* 79 (L79) type=array 2 of char class=static scope=GLOBAL
!L79	entry
!	dc	i1'114,0'
* sym() entry
* 66 (L66) type=array 25 of char class=static scope=GLOBAL
!L66	entry
!	dc	i1'32,32,105,110,32,102,105,108,101,58,32,37,115,44,32,108'
!	dc	i1'105,110,101,58,32,37,100,13,0'
* sym() entry
* 64 (L64) type=array 38 of char class=static scope=GLOBAL
!L64	entry
!	dc	i1'67,104,101,99,107,95,68,97,103,40,41,58,32,117,110,98'
!	dc	i1'97,108,97,110,99,101,100,32,112,97,114,101,110,115,58,32'
!	dc	i1'34,37,115,34,13,0'
* sym() entry
* 52 (L52) type=array 8 of char class=static scope=GLOBAL
!L52	entry
!	dc	i1'32,32,37,115,13,37,115,0'
* sym() entry
* 47 (L47) type=array 10 of char class=static scope=GLOBAL
!L47	entry
!	dc	i1'104,97,115,104,58,32,37,100,13,0'
* sym() entry
* 10 (L10) type=array 10 of char class=static scope=GLOBAL
!L10	entry
!	dc	i1'100,97,103,50,103,115,50,46,99,0'
* sym() entry
* 9 (L9) type=array 38 of char class=static scope=GLOBAL
!L9	entry
!	dc	i1'65,115,115,101,114,116,105,111,110,32,102,97,105,108,101,100'
!	dc	i1'58,32,102,105,108,101,32,34,37,115,34,44,32,108,105,110'
!	dc	i1'101,32,37,100,13,0'
* segment()
!	end
FLUSH(),()
