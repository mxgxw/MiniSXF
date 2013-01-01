MiniSXF - Copyright (c) 2012-2013 - by Mario Gomez - version 0.1.1

Introduction
---------------------
MiniSXF is a sightly modified version of MiniZip 1.1  that is built
from MiniZip 1.0 by Gilles Vollant ( http://www.winimage.com/zLibDll/minizip.html )

Original note: When adding ZIP64 support into minizip it would result
into risk of breaking compatibility with minizip 1.0.
All possible work was done for compatibility.

Note: Appears that fopen in cygwin already supports large files, so 
there is no needed to call fopen64.

Background
---------------------
There isn't a simple way to generate self extracting files on linux
web servers that can be run on Windows systems without executing external
commands.

Many hosting services doesn't allow you to run external commands, so I
need a solution that allows me to generate a self extracting file
programmaticaly without executing any externals commands in PHP.

This simple executable just try to find the data appended to itself and
extract the zipfile using the MiniZip routines.

This is a really "beta experimental version". It could have a lot of
bugs because I tried to remove all the code to make it compile under
cygwin.

The original source code can be found on:

http://www.winimage.com/zLibDll/minizip.html

Compiling (On Windows)
---------------------------------------

1-You will need to install CygWIN with gcc, make and zlib.

2-Modify the paths to zlib inside the Makefile and run:

  "make"

3-Check the file size with "ls -al MiniSXF.exe" and modify
the following line on minisxf.c
  
  const size_t payload = <<New file size here>>;

4-Run "make clean" and "make" again.

5-Check if file size is the same if not repeat from 3.

Note: It's possible that this will run on linux without
major modifications on the source code but I haven't tried
yet.

Usage (On unix systems)
---------------------------------------

To generate a self extracting file in command line just
copy the compiled executable "MiniSXF.exe" and a zipfile
with the contents. Then merge both files with the following command:

  cat MiniSXF.exe payload.zip > generated.exe

On Windows just run the generated executable.

Usage (On Windows)
---------------------------------------

Note: Tested on Windows 7 64 bits.

If you try to Run the compiled executable it's going to warn
you that there is no payload in the file and it's going to exit.

generated.exe : Extracts the contents of the payload on the current
directory.

generated.exe -v : Shows version number and copyright info.

generated.exe -l : List the contents of the file.

Changes from MiniSXF 0.1 to  MiniSXF 0.1.1
---------------------------------------

* Code now compiles with the -mno-cygwin option on windows and
 runs without cygwin.
* A lot of code cleanup, now a lot more easy to read.
* README updated with usage options.

Changed from MiniZip 1.0 to MiniZip 1.1
---------------------------------------
* Added ZIP64 support for unzip ( by Even Rouault )
* Added ZIP64 support for zip ( by Mathias Svensson )
* Reverted some changed that Even Rouault did.
* Bunch of patches received from Gulles Vollant that he received for MiniZip from various users.
* Added unzip patch for BZIP Compression method (patch create by Daniel Borca)
* Added BZIP Compress method for zip
* Did some refactoring and code cleanup


Credits

 Gilles Vollant    - Original MiniZip author
 Even Rouault      - ZIP64 unzip Support
 Daniel Borca      - BZip Compression method support in unzip
 Mathias Svensson  - ZIP64 zip support
 Mathias Svensson  - BZip Compression method support in zip

 Resources

 ZipLayout   http://result42.com/projects/ZipFileLayout
             Command line tool for Windows that shows the layout and information of the headers in a zip archive.
             Used when debugging and validating the creation of zip files using MiniZip64


 ZIP App Note  http://www.pkware.com/documents/casestudies/APPNOTE.TXT
               Zip File specification


Notes.
 * To be able to use BZip compression method in zip64.c or unzip64.c the BZIP2 lib is needed and HAVE_BZIP2 need to be defined.

License
----------------------------------------------------------
   Condition of use and distribution are the same than zlib :

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.

----------------------------------------------------------

