CC=gcc
TARGET=vax
OS=bsd
CFLAGS= -O
LDFLAGS=
INCLUDES=-I.. -I../../c

D=$(TARGET)-$(OS)

all:	$(D)/rcc

OBJS=$(D)/gen.o

$(D)/gen.o:	gen.c
		cd $(D); $(CC) -c $(CFLAGS) $(INCLUDES) ../gen.c

include ../c/makefile

$(COBJS) $(OBJS):	config.h

RUN=run
include ../tst/makefile
