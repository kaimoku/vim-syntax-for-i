" Vim syntax file
" Language:	RPG

sy case ignore

sy match rpgSpec /^.\{5}[HFELICO]/hs=e-1 contained

" C-specs...
sy match rpgNotInd1 /^.\{9}/hs=s+8 contained contains=rpgSpec
sy match rpgInd1 /^.\{9}.\{1,2}/hs=s+9 contained contains=rpgNotInd1
sy match rpgNotInd2 /^.\{11}.\{1,1}/hs=s+11 contained contains=rpgInd1
sy match rpgInd2 /^.\{12}.\{1,2}/hs=s+12 contained contains=rpgNotInd2
sy match rpgNotInd3 /^.\{14}.\{1,1}/hs=s+14 contained contains=rpgInd2
sy match rpgInd3 /^.\{15}.\{1,2}/hs=s+15 contained contains=rpgNotInd3
sy match rpgFactor1 /^.\{17}.\{1,10}/hs=s+17 contained contains=rpgInd3
sy match rpgOpcode /^.\{27}.\{1,5}/hs=s+27 contained contains=rpgFactor1
sy match rpgFactor2 /^.\{32}.\{1,10}/hs=s+32 contained contains=rpgOpcode
sy match rpgResult /^.\{42}.\{1,6}/hs=s+42 contained contains=rpgFactor2
sy match rpgResultLen /^.\{48}.\{1,3}/hs=s+48 contained contains=rpgResult
sy match rpgResultDP /^.\{51}.\{1,1}/hs=s+51 contained contains=rpgResultLen
sy match rpgResultExt /^.\{52}.\{1,1}/hs=s+52 contained contains=rpgResultDP
sy match rpgResultInd /^.\{53}.\{1,6}/hs=s+53 contained contains=rpgResultExt
sy match rpgTailComment /^.\{59}.*/hs=s+59 contained contains=rpgResultInd
sy match rpgCspec /^.\{5}C[^*].*$/ transparent contains=@rpgCspecGroup

sy cluster rpgCspecGroup contains=rpgTailComment,rpgResultInd,rpgResultExt,
            \rpgResultDP,rpgResultLen,rpgResult,rpgFactor2,rpgOpcode,rpgInd3,
	    \rpgInd2,rpgInd1

" Until further implemented...
sy match rpgOtherSpec /^.\{5}[HFIELO][^*].*$/ contains=rpgSpec

sy match rpgComment /^.\{6}\*.*$/

sy match rpgInline /^.\{6}[/+].*$/

sy region rpgData start=/^\*\* / end=/\Z/

hi link rpgCode operator
hi link rpgSpec operator
hi link rpgNotInd1 boolean
hi link rpgNotInd2 boolean
hi link rpgNotInd3 boolean
hi link rpgInd1 conditional
hi link rpgInd2 conditional
hi link rpgInd3 conditional
hi link rpgFactor1 type
hi link rpgOpcode keyword
hi link rpgFactor2 special
hi link rpgResult function
hi link rpgResultLen number
hi link rpgResultDP delimiter
hi link rpgResultExt keyword
hi link rpgResultInd function
hi link rpgTailComment comment
hi link rpgComment comment
hi link rpgInline function
hi link rpgData comment
