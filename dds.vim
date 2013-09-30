" Vim syntax file
" Language:	DDS

sy case ignore

sy match ddsSpec /^.\{5}[A]/hs=e-1 contained

" C-specs...
sy match ddsNotInd1 /^.\{8}/hs=s+7 contained contains=ddsSpec
sy match ddsInd1 /^.\{8}.\{1,2}/hs=s+8 contained contains=ddsNotInd1
sy match ddsNotInd2 /^.\{10}.\{1,1}/hs=s+10 contained contains=ddsInd1
sy match ddsInd2 /^.\{11}.\{1,2}/hs=s+11 contained contains=ddsNotInd2
sy match ddsNotInd3 /^.\{13}.\{1,1}/hs=s+13 contained contains=ddsInd2
sy match ddsInd3 /^.\{14}.\{1,2}/hs=s+14 contained contains=ddsNotInd3
sy match ddsNameType /^.\{16}.\{1,1}/hs=s+16 contained contains=ddsInd3
sy match ddsName /^.\{18}.\{1,10}/hs=s+18 contained contains=ddsNameType
sy match ddsRef /^.\{28}.\{1,1}/hs=s+28 contained contains=ddsName
sy match ddsLen /^.\{29}.\{1,5}/hs=s+29 contained contains=ddsRef
sy match ddsDataType /^.\{34}.\{1,1}/hs=s+34 contained contains=ddsLen
sy match ddsDecPos /^.\{35}.\{1,2}/hs=s+35 contained contains=ddsDataType
sy match ddsUse /^.\{37}.\{1,1}/hs=s+37 contained contains=ddsDecPos
sy match ddsLine /^.\{38}.\{1,3}/hs=s+38 contained contains=ddsUse
sy match ddsColumn /^.\{41}.\{1,3}/hs=s+41 contained contains=ddsLine
sy match ddsFunction /^.\{44}.*/hs=s+44 contained contains=ddsColumn
sy match ddsAspec /^.\{5}A[^*].*$/ transparent contains=@ddsAspecGroup

sy cluster ddsAspecGroup contains=ddsFunction,ddsColumn,ddsLine,
            \ddsUse,ddsDecPos,ddsDataType,ddsLen,ddsRef,ddsName,
	    \ddsNameType,ddsInd3,ddsInd2,ddsInd1

" Until further implemented...

sy match ddsComment /^.\{6}\*.*$/

hi link ddsSpec operator
hi link ddsNotInd1 boolean
hi link ddsNotInd2 boolean
hi link ddsNotInd3 boolean
hi link ddsInd1 conditional
hi link ddsInd2 conditional
hi link ddsInd3 conditional
hi link ddsNameType special
hi link ddsName type
hi link ddsRef special
hi link ddsLen function
hi link ddsDataType type
hi link ddsDecPos delimiter
hi link ddsUse keyword
hi link ddsLine function
hi link ddsColumn special
hi link ddsFunction function
hi link ddsComment comment
