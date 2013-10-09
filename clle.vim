" Vim syntax for CLLE
" This may use some of the Rexx code, but probably not.
" The Command/Program keyword lists will need to be modified as I come across
" more

syntax case ignore

syntax match clleLabel /^[^/*]*:/
highlight link clleLabel labels

syntax region clleComment start="/\*" end="\*/" contains=clleComment
highlight link clleComment comment

syntax match clleParam / \{1}[^ %]*(/hs=s+1,he=e-1 
highlight link clleParam type

syntax region clleString start=/'/ skip=/''/ end=/'/ oneline
highlight link clleString string

syntax match clleVariable /&[^) ]*/
highlight link clleVariable identifier

syntax keyword clleControl if do goto enddo else dofor return
highlight link clleControl keyword

syntax keyword clleCommand pgm dcl dclf monmsg chgvar subr endsubr callsubr call endpgm
            \ rtvjoba rtvneta rcvf rtvusrprf
highlight link clleCommand keyword

syntax keyword clleProgram sndpgmmsg rmvlible addlible chkobj cpylib rtvdtaara 
            \ rtvmsg sndpgmmsg ovrprtf dltf crtpf crtlf clrpfm ovrdbf dltovr cpyf
            \ crtddmf rclddmcnv crtsavf clrsavf savobj savlib rstobj rstlib ftp cf
            \ clrlib rgzpfm dspffd chgdtaara ovrmsgf chgjob rmvmsg clof
            \ sbmjob dspobjd opndbf cpysrcf dltmod movobj crtdtaq dltdtaq
highlight link clleProgram keyword

setlocal iskeyword+=%
syntax keyword clleBIF %address %addr %binary %bin %offset %ofs %substring %sst %switch
highlight link clleBIF BIF

setlocal iskeyword+=*
syntax keyword clleChoices *char *dec *int *defined *auto *based *blank
            \ *eq *gt *ge *ne *lt *le *and *or *no *yes *nolist *nomax *nosrc
            \ *last *first *dtaara *lib *libl *add *replace *savf *all
            \ *cat *tcat *bcat *ip *lda *mdy *dmy *ymd *prv *ext *status
highlight link clleChoices preproc 

" groups
highlight BIF guifg=red
highlight labels guifg=darkgrey
