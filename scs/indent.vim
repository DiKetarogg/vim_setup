" indent/scs.vim

if exists("b:did_indent")
	finish
endif
let b:did_indent = 1

if exists("*ScsIndent")
	finish 
endif

setlocal indentexpr=ScsIndent()

function! s:GetLine(num)
	return TrimLine(getline(num))
endfunction

function! s:GetPrevNu(numb)
	let num = a:numb - 1
	while 1 "while true
	if num < 1
		return 0
	endif
	while (Blank(num))
		let num = num - 1
		if num < 1
			return 0
		endif
	endwhile

	let line = getline(num)
	if match(line, '.*/\*')
		return 1
	endif
	if match(line, '.*\*/')
		let num = num - 1
		while (num > 1 && !match(getline(num), '.*/\*.*'))
			let num = num - 1
		endwhile
	endwhile "while true
endfunction

function! s:Blank(num)
	let line = getline(a:num)
	if (match(line,'^\s*$')|match(line, '^\s*//.*$')|match(line, '^\s*/\*.*\*/\s*$'))
		return 1
	endif
	return 0
endfunction

function! TrimLine(pline)
	let line = substitute(a:pline, '\\\\', '_','g')
	"remove line comment
	let line = substitute(line, '//.*$', '', 'g')
	"remove area comment
	let line = substitute(line, '/\*.*(\*/|$)', '', 'g')
	"replace complete indentifier with _
	"translated: [@not '*' @any @not '\']
	let line = substitute(line, '\[\(\*\)\@!.*\(\\\)\@!\]', '_', 'g')
	"remove incomplete identifiers
	"translated: [@not '*' @any @endline
	let line = substitute(line, '\[\(\*\)\@!.*$', '', 'g')
	"replace complete string literal with _
	"translated: "@any @not '\'"
	let line = substitute(line, '".*\(\\\)\@!"', '_', 'g')
	"remove incomplete string literal
	let line = substitute(line, '".*$', '', 'g')
	"remove any kind of paired brackets/brackets etc.
	let line = substitute(line, '\(\*.*\*\)','','g')
	let line = substitute(line, '\[\*.*\*\]','','g')
	let line = substitute(line, '\{.*\}','','g')
	return line
endfunction

function! ScsIndent()
	return 5
	let pnu = GetPrevNu(v:lnum)
	"while 1 "while true
	if !pnu
		return 0
	endif
	if match(GetLine(v:lnum), '.*(\]\*|\)\*|\}).*')
		modi = -1
	else
		modi = 0
	endif
	let pline = GetLine(pnu)
	if match(pline, '.*(\[\*|\(\*|\{).*')
		return indent(pnu) + 1 + modi
	endif
	if match(pline, ':.*\(;;\)\@!')
		return indent(pnu) + 1 + modi
	endif
	if match(pline, '.*(\]\*|\)\*|\}).*')
		return indent(pnu) + modi
	endif
	"endwhile "while true
endfunction

