# untargz for DOS (16bit, real mode)

``untgz.exe`` (also known as ``untardos.exe``) is one of the smallest open source decompressors available. It runs in plain real mode - no dos extenders or other fancy stuff.
See table with different targets for size comparison.

The untardos.exe floating around on the internet gives me trouble on a 2 machines, namely a HP OmniBook 2100 with a Pentium MMX and a 386SX-25. untardos.exe simply fails with a opcode dump on these machines. This is why I recompiled everything from source and now it works. 

Different targets have been created to compare size and speed. 
 
This file comes from public domain and was slightly modified to get rid of compiler warnings and a Makefile for OpenWatcom compiler was created. 
 
The compiled exe was built for 8086 and above. 
Makefile has different targets with different optimizations, in case you want something different. 
All used optimization-switches are explained on top of makefile. 

| Target       |  Size  |   RM/PM  | Description                                              |
| ------------ | ------ | -------- | -------------------------------------------------------- |
|``all``       |        | RM 16bit | 8086 target cpu, optimized for size (**default**)        |
|``x86small``  | 24278  |          | same as above^^                                          |
|``x86fast``   | 25238  | RM 16bit | 8086 target cpu, optimized for speed                     |
|              |        |          |                                                          |
|``386small``  | 24070  | RM 16bit | 386 target cpu, optimized for size                       |
|``386fast``   | 25014  | RM 16bit | 386 target cpu, optimized for speed                      |
|              |        |          |                                                          |
|``486small``  | 24070  | RM 16bit | 486 target cpu, optimized for size                       |
|``486fast``   | 25414  | RM 16bit | 486 target cpu, optimized for speed                      |
|              |        |          |                                                          |
|``586small``  | 24070  | RM 16bit | 586 target cpu, optimized for size                       |
|``586fast``   | 25014  | RM 16bit | 586 target cpu, optimized for speed                      |
|              |        |          |                                                          |
|``dos4g_386s``| 42496  | PM 32bit | 386 target CPU, stack based args, optimized for speed    |
|``dos4g_486s``| 42496  | PM 32bit | 486 target CPU, stack based args, optimized for speed    |
|``dos4g_586s``| 42496  | PM 32bit | 486 target CPU, stack based args, optimized for speed    |
|              |        |          |                                                          |
|``dos4g_386r``| 38392  | PM 32bit | 386 target CPU, register based args, optimized for speed |
|``dos4g_486r``| 38364  | PM 32bit | 486 target CPU, register based args, optimized for speed |
|``dos4g_586r``| 38364  | PM 32bit | 486 target CPU, register based args, optimized for speed |

Size may vary if different compiler versions used. Absolute values only for demonstration/comparison of variants.
386/32bit variants also need `dos4gw.exe`, which needs another ~260k. 
 
# creating compatible achives
This is quite simple, every recent linux tar+gzip should work.
```
$ tar cvzf archive.tgz FILE1 FILE2 FOLDER1 ...
```
 
# Licensing
untar.c is public domain software. My contributions are public domain.
