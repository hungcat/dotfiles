" clang コマンドの設定

" オプションを追加する
" filetype=cpp に対して設定する場合
let g:marching#clang_command#options = {
      \   "cpp" : "-std=c++11"
      \}

" インクルードディレクトリのパスを設定
let g:marching_include_paths = filter(
      \	split(glob('/usr/include/c++/*'), '\n') +
      \	split(glob('~/.local/include/'), '\n'),
      \	'isdirectory(v:val)')
"let g:marching_include_paths = filter(
"			\	split(glob('/usr/include/c++/*'), '\n') +
"			\	split(glob('/usr/include/*/c++/*'), '\n') +
"			\	split(glob('/usr/include/*/'), '\n') +
"			\	split(glob('~/.local/include/*'), '\n'),
"			\	'isdirectory(v:val)')

" 補完中のワード挿入を禁止
imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)
" neocomplete.vim と併用して使用する場合
let g:marching_enable_neocomplete = 1
