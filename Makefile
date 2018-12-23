# optimizations:
#	-s	disable stack overflow checks, saves about 300bytes on each executable!
#	-os	Space is favoured over time when generating code
#	-ol+	more loop optimization
#
# doc says fastest code with: -oneatx -zp4
#	-on	replace floating-point divisions with multiplications by the reciprocal
#	-oe	inline small user functions
#	-oa	alias checking relaxed
#	-ot	always prefer faster, not smaller code
#	-ox	= -oilmr -s
#	-oi	inline intrinsic functions
#	-ol	loop optimizations
#	-om	generate 387 instructions in-line for math functions
#	-or	reorder instructions to avoid pipeline stalls
#
#	-zp4	causes all data to be aligned on 4-byte boundaries	
#
#


all:
	make x86small
	make x86fast
	make 386small
	make 386fast
	make 486small
	make 486fast
	make 586small
	make 586fast
	make dos4g_386s
	make dos4g_486s
	make dos4g_586s
	make dos4g_386r
	make dos4g_486r
	make dos4g_586r	
	ls -al *.exe
	cp x86small.exe untgz.exe

x86small:
	wcl -q -0 -os -s -bt=dos -ms untar.c
	mv untar.exe x86small.exe
x86fast:
	wcl -q -0 -s -oneatx -zp4 -bt=dos -ms untar.c
	mv untar.exe x86fast.exe

386small:
	wcl -q -3 -os -s -bt=dos -ms untar.c
	mv untar.exe 386small.exe
386fast:
	wcl -q -3 -s -oneatx -zp4 -bt=dos -ms untar.c
	mv untar.exe 386fast.exe

486small:
	wcl -q -4 -os -s -bt=dos -ms untar.c
	mv untar.exe 486small.exe
486fast:
	wcl -q -4 -s -oneatx -zp4 -bt=dos -ms untar.c
	mv untar.exe 486fast.exe

586small:
	wcl -q -5 -os -s -bt=dos -ms untar.c
	mv untar.exe 586small.exe
586fast:
	wcl -q -3 -s -oneatx -zp4 -bt=dos -ms untar.c
	mv untar.exe 586fast.exe


dos4g_386s:
	wcl386 -q -3s -l=dos4g -s -bt=dos untar.c
	mv untar.exe d4g_386s.exe

dos4g_486s:
	wcl386 -q -4s -l=dos4g -s -bt=dos untar.c
	mv untar.exe d4g_486s.exe

dos4g_586s:
	wcl386 -q -5s -l=dos4g -s -bt=dos untar.c
	mv untar.exe d4g_586s.exe

dos4g_386r:
	wcl386 -q -3r -l=dos4g -s -bt=dos untar.c
	mv untar.exe d4g_386r.exe

dos4g_486r:
	wcl386 -q -4r -l=dos4g -s -bt=dos untar.c
	mv untar.exe d4g_486r.exe

dos4g_586r:
	wcl386 -q -5r -l=dos4g -s -bt=dos untar.c
	mv untar.exe d4g_586r.exe	
	
upx:
	upx -9 --8086 untar.exe -o upxed.exe

clean:
	rm -vf d4g_*.exe 386*.exe 486*.exe x86*.exe 586*.exe untgz.exe *.err *.o
