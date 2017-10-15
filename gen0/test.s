; STARTFUNC(%0),(_main)
_main	start
_i	equ	1
_a	equ	5
dag_temp_start	equ	9
gen_temp_start	equ	dag_temp_start+0
local	equ	gen_temp_start+-1
; LINK(),()
	lda	r15
	add.l	#-local
	sta	r15
; ASGNI(CNSTI(%0),ADDRLP(%1)),(0,_a)
	lda.l	#0
	sta	<_a
	stx	<_a+2
; ASGNI(CNSTI(%0),ADDRLP(%1)),(0,_i)
	lda.l	#0
	sta	<_i
	stx	<_i+2
; LABELV(%0),(L2)
L2	anop
; ARGI(INDIRI(ADDRLP(%0))),(_i)
	pei	<_i+2
	pei	<_i
; ARGP(ADDRGP(%0)),(L6)
	pea	+(L6)|-16
	pea	L6
; CALLI(ADDRGP(%0)),(_printf)
	jsl	_printf
	tsc
	clc
	adc	#8
	tcs
; LABELV(%0),(L3)
L3	anop
; ASGNI(ADDI(CNSTI(%0),INDIRI(ADDRLP(%1))),ADDRLP(%2)),(1,_i,_i)
	lda	<_i
	clc
	adc	#<1
	sta	<_i
	lda	<_i+2
	adc	#^1
	sta	<_i+2
; LTI(CNSTI(%0),INDIRI(ADDRLP(%1)),%2),(256,_i,L2)
	lda	#<256
	sec
	sbc	<_i
	beq	*+17		; 2nd check
	lda	#^256
	sbc	<_i+2
	bvc	*+5
	eor	#$8000
	bmi	*+22		; Fall through
	jmp	L2
	lda	#^256
	sbc	<_i+2
	beq	*+12		; Fall through
	bvc	*+5
	eor	#$8000
	bmi	*+5		; Fall through
	jmp	L2
; RETV(),()
	lda	r15
	add.l	#local
	sta	r15
	rts
; LABELV(%0),(L1)
L1	anop
; ENDFUNC(%0),(_main)
_main	end
; FLUSH(),()
	end
-0	data
L6	entry
	dc	i1'72,105,44,32,73,39,109,32,97,110,32,97,99,99,117,109'
	dc	i1'117,108,97,116,111,114,32,109,97,99,104,105,110,101,33,32'
	dc	i1'37,100,13,0'
	end
; FLUSH(),()
