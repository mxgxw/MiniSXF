CC=gcc

ZLIB_INCLUDE = -I../../../d/cygwin/usr/include/
ZLIB_LIB = ../../../d/cygwin/lib/libz.a
SOURCES = minisxf.c unzip.c ioapi.c

all: minisxf

minisxf:
	$(CC) $(SOURCES) -o $@ $(ZLIB_LIB) $(ZLIB_INCLUDE)
