" Vim syntax file
" Language: SQLRPGLE
" Uses rpgle.vim for the RPGLE syntax

source rpgle.vim

syntax keyword sqlKeywords exec sql set option closqlcsr datfmt commit naming fetch next from
            \ into before relative insert delete values where and or case when then else end
            \ declare scroll cursor insensitive prepare update select on join inner outer union
            \ contained
highlight link sqlKeywords identifier

syntax region sqlStatement start=/exec sql/ end=/;/ contains=sqlKeywords

