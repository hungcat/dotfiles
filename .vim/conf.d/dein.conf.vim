
let s:dein_path = g:myconf.cache . '/dein'
let s:here = expand('<sfile>:p')
let s:toml = fnamemodify(s:here, ':h') . '/dein.conf'

" for plugin settings
function! g:myconf.source_plugin_conf(path) abort
  let s:filepath = s:toml . '/plugins/' . a:path
  if filereadable(s:filepath)
    execute 'source ' . s:filepath
  endif
endfunction

"if !exists("*dein#load_state")
if !isdirectory(s:dein_path)
  finish
endif

if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path, [s:here]
        \ + split(glob(s:toml . '/*.toml'), '\n'))

  call dein#load_toml(s:toml . '/dein.toml', {'lazy': 0})
  call dein#load_toml(s:toml . '/deinlazy.toml', {'lazy' : 1})
  if has('nvim')
    call dein#load_toml(s:toml . '/nvim_deinlazy.toml', {'lazy' : 1})
  endif
  " call dein#load_toml(s:toml . '/deinft.toml')

  if dein#tap('deoplete.nvim') && has('nvim')
    call dein#disable('neocomplete.vim')
    call dein#disable('neocomplcache.vim')
  endif
  call dein#disable('neobundle.vim')
  "call dein#disable('neopairs.vim')

  call dein#end()
  call dein#save_state()
endif


if !has('nvim') && dein#check_install(['vimproc'])
  if confirm('Install vimproc?', "Yes\nNo", 2) == 1
    call dein#install(['vimproc'])
  endif
endif
if dein#check_install()
  " Installation check.
  if confirm('Install dein plugins?', "Yes\nNo", 2) == 1
    call dein#install()
  endif
endif

if !has('vim_starting')
  call dein#call_hook('source')
  call dein#call_hook('post_source')
endif

filetype plugin indent on
