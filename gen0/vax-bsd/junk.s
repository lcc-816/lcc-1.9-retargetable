* progbeg(), infile = test.c
* filename: test
* defsymbol: main
* defsymbol: 0
* defsymbol: 4
* defsymbol: printf
* defsymbol: %d
* defsymbol: 2
* defsymbol: 23
* defsymbol: 0xfffffffc
* defsymbol: 1
* segment()
*	export	_main
STARTFUNC(%0),(_main)
* sym() entry
* main (_main) type=void function(void) class=auto scope=GLOBAL ncalls=1
************************** PASS 1 **************************
* blockbeg()
* local(a)
!_a	equ	1
*
* gen() called
*
* 134692912 ASGNI (refs: 1) (4)
*     134692768 ADDRLP (refs: 1) (_a)
*     134692840 CNSTI (refs: 1) (0)
*
* gen() called
*
* 134695696 ARGI (refs: 1) (4)
*     134695624 BANDU (refs: 1)
*         134695480 CVIU (refs: 1)
*             134695408 ADDI (refs: 1)
*                 134695264 INDIRI (refs: 1)
*                     134695192 ADDRLP (refs: 1) (_a)
*                 134695336 CNSTI (refs: 1) (23)
*         134695552 CNSTU (refs: 1) ($fffffffc)
* 134695840 ARGP (refs: 1) (4)
*     134695768 ADDRGP (refs: 1) (L2)
* 134695984 CALLI (refs: 1)
*     134695912 ADDRGP (refs: 1) (_printf)
* blockend()
*
* gen() called
*
* 134699240 RETV (refs: 1)
*
* gen() called
*
* 134702568 LABELV (refs: 1) (L1)
!dag_temp_start	equ	5
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
* Blockend
* Gen
* Jump
* Label
* Defpoint
* Emit() here
ASGNI(CNSTI(%0),ADDRLP(%1)),(0,_a)
* Emit() here
ARGI(BANDU(CNSTU(%0),CVIU(ADDI(CNSTI(%1),INDIRI(ADDRLP(%2)))))),($fffffffc,23,_a)
ARGP(ADDRGP(%0)),(L2)
CALLI(ADDRGP(%0)),(_printf)
* Emit() here
RETV(),()
* Emit() here
LABELV(%0),(L1)
ENDFUNC(%0),(_main)
FLUSH(),()
* defsymbol: printf
*	import _printf
* segment()
!	end
!test0	data
* sym() entry
* 2 (L2) type=array 4 of char class=static scope=GLOBAL
!L2	entry
!	dc	i1'37,100,13,0'
* segment()
!	end
FLUSH(),()
