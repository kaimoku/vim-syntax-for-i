" Vim syntax file
" Language:	RPGIV

sy case ignore

sy match rpgSpec /^.\{5}[HFDICPO]/hs=e contained
" sy match rpgSpec /^.\{5}[HFDICO]/hs=e-1 contained

" C-specs...
sy match rpgLeadComment /^.\{1}.\{1,5}/hs=s contained contains=rpgSpec
sy match rpgNotInd /^.\{9}/hs=s+8 contained contains=rpgLeadComment
" sy match rpgNotInd /^.\{9}/hs=s+8 contained contains=rpgSpec
sy match rpgInd /^.\{9}.\{1,2}/hs=s+9 contained contains=rpgNotInd
sy match rpgFactor1 /^.\{11}.\{1,14}/hs=s+11 contained contains=rpgInd
sy match rpgOpcode /^.\{25}.\{1,10}/hs=s+25 contained contains=rpgFactor1,rpgOpcodeF2Ext
" for any opcode that allows for extended factor 2
sy match rpgOpcodeF2Ext /^.\{5}C[^*][ ]\{18}\(eval\|if\|callp\).*/hs=s+35 contains=rpgSpec,rpgLeadComment,rpgOpcode,
            \rpgTailCommentF2E,@rpgExtras
sy match rpgFactor2 /^.\{35}.\{1,14}/hs=s+35 contained contains=rpgOpcode,@rpgExtras
sy match rpgResult /^.\{49}.\{1,14}/hs=s+49 contained contains=rpgFactor2
sy match rpgResultLen /^.\{63}.\{1,5}/hs=s+63 contained contains=rpgResult
sy match rpgResultDP /^.\{68}.\{1,2}/hs=s+68 contained contains=rpgResultLen
sy match rpgResultInd /^.\{70}.\{1,6}/hs=s+70 contained contains=rpgResultDP
sy match rpgTailComment /^.\{80}.*/hs=s+80 contained contains=rpgResultInd
sy match rpgTailCommentF2E /^.\{80}.*/hs=s+80 contained contains=rpgOpcodeF2Ext,rpgSpec,@rpgExtras
sy match rpgCspec /^.\{5}C[^*].*$/ transparent contains=@rpgCspecGroup

    
sy match rpgFactor2Ext /^.\{5}C[^*][ ]\{27}.*$/hs=s+35 contained contains=rpgSpec,rpgTailCommentF2E,@rpgExtras

sy cluster rpgExtras contains=rpgString,rpgBIF,rpgConstants

sy cluster rpgCspecGroup contains=rpgTailComment,rpgResultInd,rpgResultExt,
            \rpgResultDP,rpgResultLen,rpgResult,rpgFactor2,rpgOpcode,rpgOpcodeF2Ext,rpgFactor1,
	    \rpgInd,rpgNotInd,rpgLeadComment,rpgString,rpgFactor2Ext 

" D-specs
sy match rpgDName /^.\{6}.\{1,15}/hs=s+6 contained contains=rpgSpec,rpgLeadComment
sy match rpgDExternal /^.\{21}.\{1,1}/hs=s+21 contained contains=rpgDName
sy match rpgDDSType /^.\{22}.\{1,1}/hs=s+22 contained contains=rpgDExternal
sy match rpgDDeclare /^.\{23}.\{1,2}/hs=s+23 contained contains=rpgDDSType
sy match rpgDFrom /^.\{25}.\{1,7}/hs=s+25 contained contains=rpgDDeclare
sy match rpgDToLen /^.\{32}.\{1,7}/hs=s+32 contained contains=rpgDFrom
sy match rpgDInternal /^.\{39}.\{1,1}/hs=s+39 contained contains=rpgDToLen
sy match rpgDDecPos /^.\{40}.\{1,2}/hs=s+40 contained contains=rpgDInternal
sy match rpgDKeywords /^.\{43}.\{1,37}/hs=s+43 contained contains=rpgDDecPos,rpgString,rpgConstants
sy match rpgDTailComment /^.\{80}.*/hs=s+80 contained contains=rpgDKeywords
sy match rpgDspec /^.\{5}D[^*].*$/ transparent contains=@rpgDspecGroup

sy cluster rpgDspecGroup contains=rpgDTailComment,rpgDKeywords,rpgDDecPos,
		\rpgDInternal,rpgDToLen,rpgDFrom,rpgDDeclare,rpgDDSType,
		\rpgDExternal,rpgDName,rpgLeadComment

" F-Specs...
sy match rpgFName /^.\{6}.\{1,10}/hs=s+6 contained contains=rpgSpec,rpgLeadComment
sy match rpgFType /^.\{16}.\{1,1}/hs=s+16 contained contains=rpgFName
sy match rpgFDesig /^.\{17}.\{1,1}/hs=s+17 contained contains=rpgFType
sy match rpgFEoF /^.\{18}.\{1,1}/hs=s+18 contained contains=rpgFDesig
sy match rpgFAdd /^.\{19}.\{1,1}/hs=s+19 contained contains=rpgFEoF
sy match rpgFSeq /^.\{20}.\{1,1}/hs=s+20 contained contains=rpgFAdd
sy match rpgFFormat /^.\{21}.\{1,1}/hs=s+21 contained contains=rpgFSeq
sy match rpgFRcdLn /^.\{22}.\{1,5}/hs=s+22 contained contains=rpgFFormat
sy match rpgFLimProc /^.\{27}.\{1,1}/hs=s+27 contained contains=rpgFRcdLn
sy match rpgFKeyLn /^.\{28}.\{1,5}/hs=s+28 contained contains=rpgFLimProc
sy match rpgFRAT /^.\{33}.\{1,1}/hs=s+33 contained contains=rpgFKeyLn
sy match rpgFOrg /^.\{34}.\{1,1}/hs=s+34 contained contains=rpgFRAT
sy match rpgFDevice /^.\{35}.\{1,7}/hs=s+35 contained contains=rpgFOrg
sy match rpgFKeywords /^.\{43}.\{1,37}/hs=s+43 contained contains=rpgFDevice
sy match rpgFTailComment /^.\{80}.*/hs=s+80 contained contains=rpgFKeywords
sy match rpgFspec /^.\{5}F[^*].*$/ transparent contains=@rpgFspecGroup

sy cluster rpgFspecGroup contains=rpgFTailComment,rpgFKeywords,rpgFDevice,
		\rpgFOrg,rpgFRAT,rpgFKeyLn,rpgFLimProc,rpgFRcdLn,
		\rpgFFormat,rpgFSeq,rpgFAdd,rpgFEoF,rpgFDesig,rpgFType,
		\rpgFName,rpgLeadComment
" P-Specs...
sy match rpgPName /^.\{6}.\{1,15}/hs=s+6 contained contains=rpgSpec
sy match rpgPBeginEnd /^.\{23}.\{1,1}/hs=s+23 contained contains=rpgPName
sy match rpgPKeywords /^.\{43}.\{1,37}/hs=s+43 contained contains=rpgPBeginEnd
sy match rpgPTailComment /^.\{80}.*/hs=s+80 contained contains=rpgPKeywords
sy match rpgPspec /^.\{5}P[^*].*$/ transparent contains=@rpgPspecGroup

sy cluster rpgPspecGroup contains=rpgPTailComment,rpgPKeywords,
		\rpgPBeginEnd,rpgPName,rpgLeadComment

" Until further implemented...
sy match rpgOtherSpec /^.\{5}[HIO][^*].*$/ contains=rpgSpec,rpgLeadComment

sy match rpgComment /^.\{6}\*.*$/

sy match rpgInline /^.\{6}[/+].*$/ contains=rpgLeadComment

sy region rpgData start=/^\*\* / end=/\Z/

hi link rpgPName function
hi link rpgPBeginEnd boolean
hi link rpgPKeywords keyword
hi link rpgpTailComment comment

hi link rpgFName function
hi link rpgFType type
hi link rpgFDesig boolean
hi link rpgFEoF delimiter
hi link rpgFAdd type
hi link rpgFSeq boolean
hi link rpgFFormat delimiter
hi link rpgFRcdLn number
hi link rpgFLimProc boolean
hi link rpgFKeyLn number
hi link rpgFRAT type
hi link rpgFOrg boolean
hi link rpgFDevice function
hi link rpgFKeywords keyword
hi link rpgFTailComment comment

hi link rpgCode operator
hi link rpgSpec operator
hi link rpgNotInd boolean
hi link rpgInd conditional
hi link rpgFactor1 type
hi link rpgOpcode keyword
hi link rpgOpcodeF2Ext normal
hi link rpgFactor2 type
hi link rpgFactor2Ext normal
hi link rpgResult function
hi link rpgResultLen number
hi link rpgResultDP delimiter
hi link rpgResultInd function
hi link rpgTailComment comment
hi link rpgTailCommentF2E comment
hi link rpgLeadComment comment
hi link rpgComment comment

hi link rpgDName function
hi link rpgDExternal type
hi link rpgDDSType boolean
hi link rpgDDeclare type
hi link rpgDFrom delimiter
hi link rpgDToLen number
hi link rpgDInternal type
hi link rpgDDecPos delimiter
hi link rpgDKeywords keyword
hi link rpgDTailComment comment
hi link rpgInline function
hi link rpgData comment


" my edits
" string
syntax region rpgString start=/'/ skip=/''/ end=/'/ oneline 
highlight link rpgString String

" free-format region 
syntax region rpgFree start=/^.\{5} \/free/ms=e+1 end=/^.\{5} \/end-free/me=s-1 
            \ contains=rpgBIF,rpgString,rpgFreeKeywords,rpgConstants,rpgFreeComment
highlight link rpgFree normal

" free-format comments
syntax match rpgFreeComment /\/\/.*$/
highlight link rpgFreeComment comment

" free-format keywords
syntax keyword rpgFreeKeywords acq begsr callp chain clear close commit dealloc delete
            \ dou dow dsply dump else elseif enddo endfor endif endmon endsl endsr eval 
            \ evalr except exfmt exsr feod for force if in iter leave leavesr monitor
            \ next on-error open other out post read readc reade readp readpe rel reset
            \ return rolbk select setgt setll sorta test unlock update when write
highlight link rpgFreeKeywords freekeyword

" BIFs
setlocal iskeyword+=%
syntax keyword rpgBIF %abs %addr %alloc %char %check %checkr %date %days %dec %dech %decpos
            \ %diff %div %editc %editflt %editw %elem %eof %equal %error %float %found %graph
            \ %hours %int %inth %len %lookup %minutes %months %mseconds %nullind %occur %open
            \ %paddr %parms %realloc %rem %replace %scan %seconds %shtdn %size %sqrt %status
            \ %str %subdt %subst %this %time %timestamp %tlookup %trim %triml %trimr %ucs2
            \ %uns %unsh %xfoot %xlate %years
highlight link rpgBIF Function

" built in constants
setlocal iskeyword+=*
syntax keyword rpgConstants *on *off *blank *blanks *hival *loval
highlight link rpgConstants Special

" compile-time arrays
"syntax region CTArray start=/^\**/ end=/([^\n\r]*)$/
"highlight link CTArray comment

" groups
highlight freekeyword guifg=yellow
