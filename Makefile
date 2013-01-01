CC=gcc

ZLIB_INCLUDE = -I../../../d/cygwin/usr/include/
ZLIB_LIB = ../../../d/cygwin/lib/libz.a
SOURCES = minisxf.c unzip.c ioapi.c iowin32.c

all: minisxf

minisxf:
	$(CC) $(SOURCES) -mno-cygwin -o MiniSXF.exe $(ZLIB_LIB) $(ZLIB_INCLUDE)

clean:
	rm MiniSXF.exe