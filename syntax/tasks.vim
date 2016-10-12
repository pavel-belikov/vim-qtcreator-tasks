if !exists("b:current_syntax")
    if version < 600
        syntax clear
    elseif exists("b:current_syntax")
        finish
    endif
    let b:current_syntax = 'tasks'
endif

syn match tasksLine1 /^[^\t]*$/ contains=tasksDescription
syn match tasksLine2 /^[^\t]*\t[^\t]*$/ contains=tasksType
syn match tasksLine3 /^\([^\t]*\t\)\{2}[^\t]*$/ contains=tasksFileType
syn match tasksLine4 /^\([^\t]*\t\)\{3}.*$/ contains=tasksFileLine

syn match tasksFile /[^\t]*\t/ contained
syn match tasksFileLine /[^\t]*\t/ nextgroup=tasksLine contains=tasksFile contained
syn match tasksFileType /[^\t]*\t/ nextgroup=tasksType contains=tasksFile contained
syn match tasksLine /[^\t]*\t/ nextgroup=tasksType contained
syn match tasksType /[^\t]*\t/ nextgroup=tasksDescription contained
syn match tasksDescription /.*/ contained

hi def link tasksFile Keyword
hi def link tasksLine Constant
hi def link tasksType Type

