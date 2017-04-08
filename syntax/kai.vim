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
    \ default
    \ defer
    \ else
    \ fallthrough
    \ for
    \ if
    \ switch

syn keyword kaiImport skipwhite nextgroup=kaiImportModule
    \ #import
    \ #library
    \ #foreign

syn keyword kaiDefinitionModifier
    \ private
    \ public
    \ static

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
    \ any

syn keyword kaiBoolean
    \ false
    \ true

syn keyword kaiNull
    \ nil

syn match kaiImportModule contained nextgroup=kaiImportComponent
    \ /\<[A-Za-z_][A-Za-z_0-9]*\>/
syn match kaiImportComponent contained nextgroup=kaiImportComponent
    \ /\.\<[A-Za-z_][A-Za-z_0-9]*\>/

syn match kaiTypeName contained nextgroup=kaiTypeParameters
    \ /\<[A-Za-z_][A-Za-z_0-9\.]*\>/
syn match kaiVarName contained skipwhite nextgroup=kaiTypeDeclaration
    \ /\<[A-Za-z_][A-Za-z_0-9]*\>/

syn match kaiType contained nextgroup=swiftTypeParameters
    \ /\<[A-Za-z_][A-Za-z_0-9\.]*\>[!?]\?/
syn region kaiType contained contains=swiftTypePair,swiftType
    \ matchgroup=Delimiter start=/\[/ end=/\]/
syn match kaiTypePair contained nextgroup=swiftTypeParameters,swiftTypeDeclaration
    \ /\<[A-Za-z_][A-Za-z_0-9\.]*\>[!?]\?/

syn region kaiType contained contains=swiftType,swiftParamDelim
      \ matchgroup=Delimiter start="[^@](" end=")" matchgroup=NONE skip=","
syn match kaiParamDelim contained
      \ /,/

syn match kaiTypeDeclaration skipwhite nextgroup=swiftType
      \ /:/

syn match kaiTypeDeclaration skipwhite nextgroup=swiftType
      \ /->/

syn region kaiString start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=kaiInterpolation
syn region kaiInterpolation start=/\\(/ end=/)/ contained
syn region kaiComment start="/\*" end="\*/" contains=kaiComment,kaiLineComment,kaiTodo
syn region kaiLineComment start="//" end="$" contains=kaiComment, kaiTodo

syn match kaiDecimal /[+\-]\?\<\([0-9][0-9_]*\)\([.][0-9_]*\)\?\([eE][+\-]\?[0-9][0-9_]*\)\?\>/
syn match kaiHex /[+\-]\?\<0x[0-9A-Fa-f][0-9A-Fa-f_]*\(\([.][0-9A-Fa-f_]*\)\?[pP][+\-]\?[0-9][0-9_]*\)\?\>/
syn match kaiOct /[+\-]\?\<0o[0-7][0-7_]*\>/
syn match kaiBin /[+\-]\?\<0b[01][01_]*\>/

syn match kaiOperator +\.\@<!\.\.\.\@!\|[/=\-+*%<>!&|^~]\@<!\(/[/*]\@![/=\-+*%<>!&|^~]*\|*/\@![/=\-+*%<>!&|^~]*\|->\@![/=\-+*%<>!&|^~]*\|[=+%<>!&|^~][/=\-+*%<>!&|^~]*\)+ skipwhite nextgroup=swiftTypeParameters
syn match kaiOperator "\.\.[<.]" skipwhite nextgroup=swiftTypeParameters

syn keyword kaiTodo MARK TODO FIXME contained

hi def link kaiImport Include
hi def link kaiImportModule Title
hi def link kaiImportComponent Identifier
hi def link kaiKeyword Statement
hi def link kaiTypeDefinition Define
hi def link kaiType Type
hi def link kaiTypePair Type
hi def link kaiTypeName Function
hi def link kaiDefinitionModifier Define
hi def link kaiVarDefinition Define
hi def link kaiVarName Identifier
hi def link kaiIdentifierKeyword Identifier
hi def link kaiTypeDeclaration Delimiter
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
let b:current_syntax = "kai"
