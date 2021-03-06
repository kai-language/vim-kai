" Vim syntax file
" Language: Kai
" Maintainer: Brett R. Toomey <brettcwx@gmail.com>
" Last Change: 2017 Feb. 16

if exists("b:current_syntax")
    finish
endif

syn keyword kaiKeyword
    \ break
    \ case
    \ continue
    \ defer
    \ else
    \ fallthrough
    \ for
    \ if
    \ switch
    \ return
    \ using
    \ fn

syn keyword kaiTypeDefinition skipwhite nextgroup=kaiTypeName
    \ enum
    \ union
    \ struct
    \ void
    \ int
    \ i64
    \ u64
    \ i32
    \ u32
    \ i16
    \ u16
    \ i8
    \ u8
    \ i1
    \ bool
    \ f64
    \ f32
    \ string
    \ rawptr
    \ any
    \ number

syn keyword kaiBoolean
    \ false
    \ true

syn keyword kaiNull
    \ nil

syn match kaiDirective
    \ /#[A-za-z_][A-Za-z_0-9]*/

syn match kaiTypeName contained nextgroup=kaiTypeParameters
    \ /\<[A-Za-z_][A-Za-z_0-9\.]*\>/
syn match kaiVarName contained skipwhite nextgroup=kaiTypeDeclaration
    \ /\<[A-Za-z_][A-Za-z_0-9]*\>/

syn region kaiType contained contains=swiftType,swiftParamDelim
      \ matchgroup=Delimiter start="[^@](" end=")" matchgroup=NONE skip=","
syn match kaiParamDelim contained
      \ /,/

syn match kaiTypeDeclaration skipwhite nextgroup=swiftType
      \ /:/

syn match kaiTypeDeclaration skipwhite nextgroup=swiftType
      \ /->/

syn match kaiTag skipwhite
      \ /@[A-Za-z_][A-Za-z_0-9]*/

syn region kaiString start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=kaiInterpolation,kaiPrintFModifiers,kaiStringEscapes
syn region kaiInterpolation start=/\\(/ end=/)/ contained
syn region kaiComment start="/\*" end="\*/" contains=kaiComment,kaiLineComment,kaiTodo
syn region kaiLineComment start="//" end="$" contains=kaiComment, kaiTodo

syn match kaiDecimal /[+\-]\?\<\([0-9][0-9_]*\)\([.][0-9_]*\)\?\([eE][+\-]\?[0-9][0-9_]*\)\?\>/
syn match kaiHex /[+\-]\?\<0x[0-9A-Fa-f][0-9A-Fa-f_]*\(\([.][0-9A-Fa-f_]*\)\?[pP][+\-]\?[0-9][0-9_]*\)\?\>/
syn match kaiOct /[+\-]\?\<0o[0-7][0-7_]*\>/
syn match kaiBin /[+\-]\?\<0b[01][01_]*\>/

syn match kaiPrintFModifiers contained containedin=kaiString
    \ /%\(\d*.\d*f\|\d*d\|[d\|i\|u\|f\|F\|e\|E\|g\|G\|x\|X\|o\|s\|c\|p\|a\|A\|n]\)/

syn match kaiStringEscapes
    \ /\\[a-z]/

syn match kaiOperator +\.\@<!\.\.\.\@!\|[/=\-+*%<>!&|^~]\@<!\(/[/*]\@![/=\-+*%<>!&|^~]*\|*/\@![/=\-+*%<>!&|^~]*\|->\@![/=\-+*%<>!&|^~]*\|[=+%<>!&|^~][/=\-+*%<>!&|^~]*\)+ skipwhite nextgroup=swiftTypeParameters
syn match kaiOperator "\.\.[<.]" skipwhite nextgroup=swiftTypeParameters

syn keyword kaiTodo MARK TODO FIXME contained

syn match kaiPolymorphic
    \ /\$[A-Za-a_0-9]\+/

hi def link kaiDirective Define
hi def link kaiKeyword Statement
hi def link kaiTypeDefinition Define
hi def link kaiType Type
hi def link kaiTypeName Function
hi def link kaiVarDefinition Define
hi def link kaiVarName Identifier
hi def link kaiIdentifierKeyword Identifier
hi def link kaiTypeDeclaration Delimiter
hi def link kaiTag Statement
hi def link kaiTypeParameters Delimeter
hi def link kaiBoolean Boolean
hi def link kaiString String
hi def link kaiComment Comment
hi def link kaiLineComment Comment
hi def link kaiDecimal Number
hi def link kaiHex Number
hi def link kaiOct Number
hi def link kaiBin Number
hi def link kaiOperator Function
hi def link kaiTodo Todo
hi def link kaiNull Constant
hi def link kaiPrintFModifiers Todo
hi def link kaiStringEscapes Todo
hi def link kaiPolymorphic Todo

let b:current_syntax = "kai"
