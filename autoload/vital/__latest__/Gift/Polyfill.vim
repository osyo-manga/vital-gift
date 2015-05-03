scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

if v:version > 703 || v:version == 703 && has("patch831")
	function! s:gettabwinvar(...)
		return call("gettabwinvar", a:000)
	endfunction

	function! s:gettabvar(...)
		return call("gettabvar", a:000)
	endfunction
else
	function! s:gettabwinvar(tabnr, winnr, varname, ...)
		let def = get(a:, 1, "")
		let r = gettabwinvar(a:tabnr, a:winnr, a:varname)
		return (r is# "" ? def : r)
	endfunction

	function! s:gettabvar(tabnr, varname, ...)
		let def = get(a:, 1, "")
		let r = gettabvar(a:tabnr, a:varname)
		return (r is# "" ? def : r)
	endfunction
endif

let &cpo = s:save_cpo
unlet s:save_cpo
