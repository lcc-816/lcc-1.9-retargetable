progbeg argv=/usr/local/lib/rcc 
segment data
export cpp
global cpp type=incomplete array of pointer to char class=auto scope=GLOBAL
defaddress 1
defaddress 2
defaddress 3
defaddress 4
defaddress 5
defaddress 6
defaddress 7
defaddress 8
defaddress 9
defaddress 10
defaddress 11
defaddress 12
defaddress 13
defconst void* 0x0
export com
global com type=incomplete array of pointer to char class=auto scope=GLOBAL
defaddress 14
defaddress 11
defaddress 12
defaddress 13
defconst void* 0x0
export include
global include type=incomplete array of pointer to char class=auto scope=GLOBAL
defaddress 15
defaddress 16
defconst void* 0x0
export as
global as type=incomplete array of pointer to char class=auto scope=GLOBAL
defaddress 17
defaddress 18
defaddress 13
defaddress 11
defaddress 19
defaddress 12
defconst void* 0x0
export ld
global ld type=incomplete array of pointer to char class=auto scope=GLOBAL
defaddress 20
defaddress 18
defaddress 13
defaddress 21
defaddress 11
defaddress 12
defaddress 22
defaddress 22
defaddress 23
defaddress 24
defconst void* 0x0
segment text
export option
function option type=int function class=auto scope=GLOBAL ncalls=3
caller's parameter arg type=pointer to char class=auto scope=PARAM offset=0 ref=0
callee's parameter arg type=pointer to char class=auto scope=PARAM offset=0 ref=1750
maxoffset=0
node#3 ADDRFP count=1 arg
node#2 INDIRP count=1 #3
node'1 ARGP count=0 #2 4 4
node#5 ADDRGP count=1 28
node'4 ARGP count=0 #5 4 4
node#7 ADDRGP count=1 strcmp
node'6 CALLI count=1 #7
node#9 CNSTI count=1 0
node'8 NEI count=0 #6 #9 26
node#2 ADDRGP count=1 27
node'1 JUMPV count=0 #2
26:
node#3 ADDRFP count=1 arg
node#2 INDIRP count=1 #3
node'1 ARGP count=0 #2 4 4
node#5 ADDRGP count=1 31
node'4 ARGP count=0 #5 4 4
node#7 ADDRGP count=1 strcmp
node'6 CALLI count=1 #7
node#9 CNSTI count=1 0
node'8 NEI count=0 #6 #9 29
node#2 ADDRGP count=1 ld+12 (32)
node#3 ADDRGP count=1 33
node'1 ASGNP count=0 #2 #3 4 4
node#2 ADDRGP count=1 ld+28 (34)
node#3 ADDRGP count=1 35
node'1 ASGNP count=0 #2 #3 4 4
node#2 ADDRGP count=1 30
node'1 JUMPV count=0 #2
29:
node#3 ADDRFP count=1 arg
node#2 INDIRP count=1 #3
node'1 ARGP count=0 #2 4 4
node#5 ADDRGP count=1 38
node'4 ARGP count=0 #5 4 4
node#7 ADDRGP count=1 strcmp
node'6 CALLI count=1 #7
node#9 CNSTI count=1 0
node'8 NEI count=0 #6 #9 36
node#2 ADDRGP count=1 ld+24 (39)
node#3 ADDRGP count=1 40
node'1 ASGNP count=0 #2 #3 4 4
node#2 ADDRGP count=1 37
node'1 JUMPV count=0 #2
36:
node#2 CNSTI count=1 0
node'1 RETI count=0 #2
node#2 ADDRGP count=1 25
node'1 JUMPV count=0 #2
37:
30:
27:
node#2 CNSTI count=1 1
node'1 RETI count=0 #2
25:
end option
import strtok
import strstr
import strspn
import strrchr
import strpbrk
import strncpy
import strncmp
import strncat
import strlen
import strdup
import strcspn
import strcpy
import strcmp
import strchr
import strcat
segment lit
global 40 type=array 24 of char class=static scope=GLOBAL
defstring "/usr/local/lib/bbexit.o\000"
global 38 type=array 3 of char class=static scope=GLOBAL
defstring "-b\000"
global 35 type=array 30 of char class=static scope=GLOBAL
defstring "/usr/lib/cmplrs/cc/libprof1.a\000"
global 33 type=array 13 of char class=static scope=GLOBAL
defstring "/lib/mcrt1.o\000"
global 31 type=array 3 of char class=static scope=GLOBAL
defstring "-p\000"
global 28 type=array 3 of char class=static scope=GLOBAL
defstring "-g\000"
global 24 type=array 12 of char class=static scope=GLOBAL
defstring "/lib/crtn.o\000"
global 23 type=array 4 of char class=static scope=GLOBAL
defstring "-lc\000"
global 22 type=array 1 of char class=static scope=GLOBAL
defstring "\000"
global 21 type=array 12 of char class=static scope=GLOBAL
defstring "/lib/crt1.o\000"
global 20 type=array 12 of char class=static scope=GLOBAL
defstring "/usr/bin/ld\000"
global 19 type=array 7 of char class=static scope=GLOBAL
defstring "-nocpp\000"
global 18 type=array 3 of char class=static scope=GLOBAL
defstring "-o\000"
global 17 type=array 12 of char class=static scope=GLOBAL
defstring "/usr/bin/as\000"
global 16 type=array 25 of char class=static scope=GLOBAL
defstring "-I/usr/local/include/lcc\000"
global 15 type=array 21 of char class=static scope=GLOBAL
defstring "-I/usr/local/include\000"
global 14 type=array 19 of char class=static scope=GLOBAL
defstring "/usr/local/lib/rcc\000"
global 13 type=array 3 of char class=static scope=GLOBAL
defstring "$3\000"
global 12 type=array 3 of char class=static scope=GLOBAL
defstring "$2\000"
global 11 type=array 3 of char class=static scope=GLOBAL
defstring "$1\000"
global 10 type=array 10 of char class=static scope=GLOBAL
defstring "-D_MIPSEB\000"
global 9 type=array 9 of char class=static scope=GLOBAL
defstring "-DMIPSEB\000"
global 8 type=array 16 of char class=static scope=GLOBAL
defstring "-D_SYSTYPE_SYSV\000"
global 7 type=array 15 of char class=static scope=GLOBAL
defstring "-DSYSTYPE_SYSV\000"
global 6 type=array 12 of char class=static scope=GLOBAL
defstring "-Dhost_mips\000"
global 5 type=array 7 of char class=static scope=GLOBAL
defstring "-Dmips\000"
global 4 type=array 14 of char class=static scope=GLOBAL
defstring "-D_LANGUAGE_C\000"
global 3 type=array 13 of char class=static scope=GLOBAL
defstring "-DLANGUAGE_C\000"
global 2 type=array 7 of char class=static scope=GLOBAL
defstring "-undef\000"
global 1 type=array 23 of char class=static scope=GLOBAL
defstring "/usr/local/lib/gcc-cpp\000"
progend
