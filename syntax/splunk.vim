" Vim syntax file
" Language: Splunk Searches
" Maintainer: Me!

if exists("b:current_syntax")
  finish
endif

syn keyword commands eval where dedup sort streamstats stats where xyseries table search join rename
syn match filters /[^ =]\+\(=\|>\)/ skipwhite
syn match consts /[\|=]/
syn match sComment /\/\/.*/

let b:current_syntax = "splunk"

hi def link commands Type
hi def link filters Constant
hi def link consts Statement
hi def link sComment Comment
