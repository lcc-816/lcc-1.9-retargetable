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
defconst void* 0x0
export include
global include type=incomplete array of pointer to char class=auto scope=GLOBAL
defaddress 9
defaddress 10
defconst void* 0x0
export com
global com type=incomplete array of pointer to char class=auto scope=GLOBAL
defaddress 11
defaddress 6
defaddress 7
defaddress 8
defconst void* 0x0
export as
global as type=incomplete array of pointer to char class=auto scope=GLOBAL
defaddress 12
defaddress 13
defaddress 8
defaddress 14
defaddress 6
defaddress 7
defconst void* 0x0
export ld
global ld type=incomplete array of pointer to char class=auto scope=GLOBAL
defaddress 15
defaddress 13
defaddress 8
defaddress 16
defaddress 17
defaddress 18
defaddress 19
defaddress 20
defaddress 6
defaddress 21
defaddress 22
defaddress 23
defaddress 7
defaddress 24
defaddress 24
defaddress 25
defaddress 24
defaddress 26
defconst void* 0x0
global libprefix type=pointer to char class=static scope=GLOBAL
defaddress 27
segment text
export option
function option type=int function class=auto scope=GLOBAL ncalls=14
caller's parameter arg type=pointer to char class=auto scope=PARAM offset=0 ref=0
callee's parameter arg type=pointer to char class=auto scope=PARAM offset=0 ref=2014
maxoffset=0
node#3 ADDRFP count=1 arg
node#2 INDIRP count=1 #3
node'1 ARGP count=0 #2 4 4
node#5 ADDRGP count=1 31
node'4 ARGP count=0 #5 4 4
node#7 ADDRGP count=1 strcmp
node'6 CALLI count=1 #7
node#9 CNSTI count=1 0
node'8 NEI count=0 #6 #9 29
node#2 ADDRGP count=1 ld+64 (32)
node#3 ADDRGP count=1 33
node'1 ASGNP count=0 #2 #3 4 4
node#2 ADDRGP count=1 30
node'1 JUMPV count=0 #2
29:
node#3 ADDRFP count=1 arg
node#2 INDIRP count=1 #3
node'1 ARGP count=0 #2 4 4
node#5 ADDRGP count=1 36
node'4 ARGP count=0 #5 4 4
node#7 ADDRGP count=1 strcmp
node'6 CALLI count=1 #7
node#9 CNSTI count=1 0
node'8 NEI count=0 #6 #9 34
node#12 ADDRGP count=1 ld+36 (37)
node#11 INDIRP count=1 #12
node'10 ARGP count=0 #11 4 4
node#14 ADDRGP count=1 21
node'13 ARGP count=0 #14 4 4
node#16 ADDRGP count=1 strcmp
node'15 CALLI count=1 #16
node#18 CNSTI count=1 0
node'17 NEI count=0 #15 #18 34
node#2 ADDRGP count=1 ld+36 (38)
node#3 ADDRGP count=1 39
node'1 ASGNP count=0 #2 #3 4 4
node#2 ADDRGP count=1 ld+68 (40)
node#3 ADDRGP count=1 41
node'1 ASGNP count=0 #2 #3 4 4
node#2 ADDRGP count=1 35
node'1 JUMPV count=0 #2
34:
node#3 ADDRFP count=1 arg
node#2 INDIRP count=1 #3
node'1 ARGP count=0 #2 4 4
node#5 ADDRGP count=1 44
node'4 ARGP count=0 #5 4 4
node#7 ADDRGP count=1 strcmp
node'6 CALLI count=1 #7
node#9 CNSTI count=1 0
node'8 NEI count=0 #6 #9 42
node#12 ADDRGP count=1 ld+36 (45)
node#11 INDIRP count=1 #12
node'10 ARGP count=0 #11 4 4
node#14 ADDRGP count=1 21
node'13 ARGP count=0 #14 4 4
node#16 ADDRGP count=1 strcmp
node'15 CALLI count=1 #16
node#18 CNSTI count=1 0
node'17 NEI count=0 #15 #18 42
node#2 ADDRGP count=1 ld+36 (46)
node#3 ADDRGP count=1 47
node'1 ASGNP count=0 #2 #3 4 4
node#2 ADDRGP count=1 ld+68 (48)
node#3 ADDRGP count=1 41
node'1 ASGNP count=0 #2 #3 4 4
node#2 ADDRGP count=1 43
node'1 JUMPV count=0 #2
42:
node#3 ADDRFP count=1 arg
node#2 INDIRP count=1 #3
node'1 ARGP count=0 #2 4 4
node#5 ADDRGP count=1 51
node'4 ARGP count=0 #5 4 4
node#7 ADDRGP count=1 strcmp
node'6 CALLI count=1 #7
node#9 CNSTI count=1 0
node'8 NEI count=0 #6 #9 49
node#11 ADDRGP count=1 52
node'10 ARGP count=0 #11 4 4
node#13 CNSTI count=1 4
node'12 ARGI count=0 #13 4 4
node#15 ADDRGP count=1 access
node'14 CALLI count=1 #15
node#17 CNSTI count=1 0
node'16 NEI count=0 #14 #17 49
node#2 ADDRGP count=1 ld+52 (53)
node#3 ADDRGP count=1 52
node'1 ASGNP count=0 #2 #3 4 4
node#2 ADDRGP count=1 50
node'1 JUMPV count=0 #2
49:
node#3 ADDRFP count=1 arg
node#2 INDIRP count=1 #3
node'1 ARGP count=0 #2 4 4
node#5 ADDRGP count=1 56
node'4 ARGP count=0 #5 4 4
node#7 CNSTI count=1 2
node'6 ARGI count=0 #7 4 4
node#9 ADDRGP count=1 strncmp
node'8 CALLI count=1 #9
node#11 CNSTI count=1 0
node'10 NEI count=0 #8 #11 54
node#2 ADDRGP count=1 libprefix
node#5 ADDRFP count=1 arg
node#4 INDIRP count=1 #5
node#6 CNSTI count=1 2
node#3 ADDP count=1 #4 #6
node'1 ASGNP count=0 #2 #3 4 4
node#2 ADDRGP count=1 55
node'1 JUMPV count=0 #2
54:
node#3 ADDRFP count=1 arg
node#2 INDIRP count=1 #3
node'1 ARGP count=0 #2 4 4
node#5 ADDRGP count=1 59
node'4 ARGP count=0 #5 4 4
node#7 ADDRGP count=1 strcmp
node'6 CALLI count=1 #7
node#9 CNSTI count=1 0
node'8 NEI count=0 #6 #9 57
node#12 ADDRGP count=1 ld+36 (60)
node#11 INDIRP count=1 #12
node'10 ARGP count=0 #11 4 4
node#14 ADDRGP count=1 21
node'13 ARGP count=0 #14 4 4
node#16 ADDRGP count=1 strcmp
node'15 CALLI count=1 #16
node#18 CNSTI count=1 0
node'17 NEI count=0 #15 #18 57
node#3 ADDRGP count=1 libprefix
node#2 INDIRP count=1 #3
node'1 ARGP count=0 #2 4 4
node#5 ADDRGP count=1 61
node'4 ARGP count=0 #5 4 4
node#7 ADDRGP count=1 concat
node'6 CALLI count=1 #7
node#9 ADDRGP count=1 com
node#10 CVUP count=1 #6
node'8 ASGNP count=0 #9 #10 4 4
node#12 ADDRGP count=1 ld
node#13 ADDRGP count=1 62
node'11 ASGNP count=0 #12 #13 4 4
node#16 ADDRGP count=1 libprefix
node#15 INDIRP count=1 #16
node'14 ARGP count=0 #15 4 4
node#18 ADDRGP count=1 64
node'17 ARGP count=0 #18 4 4
node#20 ADDRGP count=1 concat
node'19 CALLI count=1 #20
node#22 ADDRGP count=1 ld+36 (63)
node#23 CVUP count=1 #19
node'21 ASGNP count=0 #22 #23 4 4
node#3 ADDRGP count=1 libprefix
node#2 INDIRP count=1 #3
node'1 ARGP count=0 #2 4 4
node#5 ADDRGP count=1 66
node'4 ARGP count=0 #5 4 4
node#7 ADDRGP count=1 concat
node'6 CALLI count=1 #7
node#9 ADDRGP count=1 ld+56 (65)
node#10 CVUP count=1 #6
node'8 ASGNP count=0 #9 #10 4 4
node#2 ADDRGP count=1 58
node'1 JUMPV count=0 #2
57:
node#3 ADDRFP count=1 arg
node#2 INDIRP count=1 #3
node'1 ARGP count=0 #2 4 4
node#5 ADDRGP count=1 69
node'4 ARGP count=0 #5 4 4
node#7 ADDRGP count=1 strcmp
node'6 CALLI count=1 #7
node#9 CNSTI count=1 0
node'8 NEI count=0 #6 #9 67
node#2 ADDRGP count=1 68
node'1 JUMPV count=0 #2
67:
node#2 CNSTI count=1 0
node'1 RETI count=0 #2
node#2 ADDRGP count=1 28
node'1 JUMPV count=0 #2
68:
58:
55:
50:
43:
35:
30:
node#2 CNSTI count=1 1
node'1 RETI count=0 #2
28:
end option
import concat
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
import access
segment lit
global 69 type=array 8 of char class=static scope=GLOBAL
defstring "-f68881\000"
global 66 type=array 12 of char class=static scope=GLOBAL
defstring "sun3/Cnub.o\000"
global 64 type=array 12 of char class=static scope=GLOBAL
defstring "sun3/crt0.o\000"
global 62 type=array 29 of char class=static scope=GLOBAL
defstring "/cmnusr/local/lib/ldb/ldb-ld\000"
global 61 type=array 9 of char class=static scope=GLOBAL
defstring "sun3/rcc\000"
global 59 type=array 3 of char class=static scope=GLOBAL
defstring "-G\000"
global 56 type=array 3 of char class=static scope=GLOBAL
defstring "-B\000"
global 52 type=array 24 of char class=static scope=GLOBAL
defstring "/usr/local/lib/bbexit.o\000"
global 51 type=array 3 of char class=static scope=GLOBAL
defstring "-b\000"
global 47 type=array 17 of char class=static scope=GLOBAL
defstring "/usr/lib/gcrt0.o\000"
global 44 type=array 4 of char class=static scope=GLOBAL
defstring "-pg\000"
global 41 type=array 6 of char class=static scope=GLOBAL
defstring "-lc_p\000"
global 39 type=array 17 of char class=static scope=GLOBAL
defstring "/usr/lib/mcrt0.o\000"
global 36 type=array 3 of char class=static scope=GLOBAL
defstring "-p\000"
global 33 type=array 4 of char class=static scope=GLOBAL
defstring "-lg\000"
global 31 type=array 3 of char class=static scope=GLOBAL
defstring "-g\000"
global 27 type=array 23 of char class=static scope=GLOBAL
defstring "/cmnusr/local/lib/ldb/\000"
global 26 type=array 4 of char class=static scope=GLOBAL
defstring "-lc\000"
global 25 type=array 4 of char class=static scope=GLOBAL
defstring "-lm\000"
global 24 type=array 1 of char class=static scope=GLOBAL
defstring "\000"
global 23 type=array 18 of char class=static scope=GLOBAL
defstring "-L/usr/lib/f68881\000"
global 22 type=array 17 of char class=static scope=GLOBAL
defstring "/usr/lib/Mcrt1.o\000"
global 21 type=array 16 of char class=static scope=GLOBAL
defstring "/usr/lib/crt0.o\000"
global 20 type=array 3 of char class=static scope=GLOBAL
defstring "-X\000"
global 19 type=array 6 of char class=static scope=GLOBAL
defstring "start\000"
global 18 type=array 3 of char class=static scope=GLOBAL
defstring "-e\000"
global 17 type=array 4 of char class=static scope=GLOBAL
defstring "-dp\000"
global 16 type=array 4 of char class=static scope=GLOBAL
defstring "-dc\000"
global 15 type=array 8 of char class=static scope=GLOBAL
defstring "/bin/ld\000"
global 14 type=array 9 of char class=static scope=GLOBAL
defstring "-mc68020\000"
global 13 type=array 3 of char class=static scope=GLOBAL
defstring "-o\000"
global 12 type=array 8 of char class=static scope=GLOBAL
defstring "/bin/as\000"
global 11 type=array 19 of char class=static scope=GLOBAL
defstring "/usr/local/lib/rcc\000"
global 10 type=array 15 of char class=static scope=GLOBAL
defstring "-I/usr/include\000"
global 9 type=array 26 of char class=static scope=GLOBAL
defstring "-I/usr/local/include/ansi\000"
global 8 type=array 3 of char class=static scope=GLOBAL
defstring "$3\000"
global 7 type=array 3 of char class=static scope=GLOBAL
defstring "$2\000"
global 6 type=array 3 of char class=static scope=GLOBAL
defstring "$1\000"
global 5 type=array 6 of char class=static scope=GLOBAL
defstring "-Dsun\000"
global 4 type=array 10 of char class=static scope=GLOBAL
defstring "-Dmc68020\000"
global 3 type=array 10 of char class=static scope=GLOBAL
defstring "-Dmc68000\000"
global 2 type=array 7 of char class=static scope=GLOBAL
defstring "-undef\000"
global 1 type=array 23 of char class=static scope=GLOBAL
defstring "/usr/local/lib/gcc-cpp\000"
progend
