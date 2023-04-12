 " set guifont=JetBrains\ Mono\ Nerd\ Font\ Mono:h14
 " set guifont=DroidSansMono_Nerd_Font:h11
" set guifont=DroidSansMono\ Nerd\ Font\ 11
"  Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'https://github.com/Mofiqul/dracula.nvim'
Plug 'https://github.com/mg979/docgen.vim'
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
" Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
" " Plug 'https://github.com/glepnir/dashboard-nvim'
" Plug 'junegunn/fzf'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'rbgrouleff/bclose.vim'
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/tpope/vim-commentary'
" Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'terryma/vim-multiple-cursors'
Plug 'https://github.com/preservim/tagbar'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'ryanoasis/vim-devicons'
" Plug 'reedes/vim-wheel'
Plug 'https://github.com/github/copilot.vim.git'
" Plug 'JASONews/glow-hover'
Plug 'liuchengxu/vim-which-key'
set encoding=UTF-8
call plug#end()
set encoding=UTF-8
" Default settings
set number
set relativenumber
syntax on
set tabstop=4
set backspace=indent,eol,start
set incsearch
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set mouse=a
set autoindent
set smarttab
set softtabstop=4
set shiftwidth=4
set splitbelow splitright
autocmd InsertEnter,InsertLeave * set cul!
set nowrap
set showcmd
let &t_SI = "\e[6 q]"
set clipboard+=unnamedplus 
" let mapleader = "\<Space>"
" nnoremap <SPACE> <Nop>
" unmap <k>
" set t_Co=256
" colorscheme solarized 




" KEY MAPPING
let mapleader = ',' " Leader Key

" Default Key Mapping

" Disable original mapping for m
map m <Nop> 

" Another way to go in insert mode
map <Leader>, i


" Directions
noremap k h
noremap l j
noremap o k
nnoremap m l

vnoremap k h
vnoremap l j
vnoremap o k
vnoremap m l
" Begin/End of l ine
noremap j 0
map ' $

" Fast move
noremap <C-k> b
" noremap <S-h> b
noremap <C-l> 5j
" noremap <S-j> 5j
" noremap <S-k> 5k
noremap <C-m> w 
" noremap <C-k> 5k
" noremap <S-L> w
noremap <C-o> 5k
" noremap <C-L> w
map <S-Up> 5k
map <S-Down> 5j
" map <C-Right> w
" map <C-Left> b
map <S-Right> w
map <S-Left> b



" Recall saved commands (from recording)
noremap h @

" Insert line below/above
noremap t o
noremap T O

" Switch window
nnoremap <S-o>  <C-w>k
nnoremap <S-k>  <C-w>h
nnoremap <S-l>  <C-w>j
nnoremap <S-m> <C-w>l

" Reload Vim
map <C-y> :source ~/.config/nvim/init.vim<CR>

" Switch next/previous buffer

" Binds to Save and Quit
map <C-s> :w<CR>
nmap <C-a> :q<CR>
map <S-q> :q!<CR>
map <C-a-Q> :q!<CR>
map <C-S-Q> :q!<CR>
imap <C-s> <Esc>:w<CR>

imap <C-a> <Esc>:q<CR>
nmap <C-v> :vs N<CR> 

" Color Scheme
set background=dark
colorscheme nord 

" Bookmark
let g:bookmark_sign = '♥'
let g:bookmark_no_default_key_mappings = 1

" TEST ZONE 
" -------------------------------------------------
"  Move lines
"  exemple : 5j
"  5j = 5 lines down
"  5k = 5 lines up
"  5h = 5 words left
"  -------------------------------------------------
"  Copy lines
"  exemple : 5yy
"  5yy = 5 lines copy
"  -------------------------------------------------

noremap <C-u> :m-2<CR>
noremap <C-j> :m+<CR>

xnoremap <C-u> :m-2<CR>gv=gv
xnoremap <C-j> :m'>+<CR>gv=gv

inoremap <C-u> <Esc>: m-2<CR>a
inoremap <C-j> <Esc> :m+<CR>i





" nnoremap <C-j> :m+<CR>

" map <C-u> :m-2<CR>
" map <C-j> :m+<CR>
" nnoremap <C-u> :m-2<CR>





" vmap <Leader>u :m .-2<CR>==
" vmap <Leader>j :m .+1<CR>==
" map <Leader>u :m .-2<CR>==
" map <Leader>j :m .+1<CR>==
" autocmd BufEnter * lcd %:p:h
" Default mapping
" let g:multi_cursor_use_default_mapping=0
" let g:multi_cursor_start_word_key      = '<C-n>'
" let g:multi_cursor_start_key           = 'g<C-n>'
" let g:multi_cursor_skip_key            = '<C-x>'
" let g:multi_cursor_select_all_word_key = '<A-n>'

" let g:multi_cursor_quit_key            = '<Esc>'
" let g:multi_cursor_prev_key            = '<C-p>'
" let g:multi_cursor_next_key            = '<C-n>'
" let g:multi_cursor_select_all_key      = 'g<A-n>'
"
" let g:doge_doc_standard_cpp


" DocGen
" g:doge_mapping :<C-y>
nmap ,d <Plug>(DocGen)
nmap ,D <Plug>(DocGen!)
nmap ,x <Plug>(DocBox)
nmap ,X <Plug>(DocBox!)

" map <Leader>t :term:<CR>i<CR>
let g:wheel#map#mouse = -1  

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'onedark'
set showtabline=2

" Terminal
imap <C-t> <Esc>:sp term://zsh<CR>i<CR>
map <C-t> :sp term://zsh<CR>i<CR>
" tmap <C-q> <C-\><C-n>:q<CR>
tmap <C-s> <C-\><C-n>
tmap <C-a> <C-\><C-n>:q<CR>
tmap <C-Left>  <C-\><C-n><C-w>h
tmap <C-Right>  <C-\><C-n><C-w>l
tmap <C-Up>  <C-\><C-n><C-w>k
tmap <C-Down>  <C-\><C-n><C-w>j
tmap <Esc> <C-\><C-n>map <C-s> :w<CR>

" NERDTree
map <C-d> :NERDTreeToggle <CR>
map <Leader>d :NERDTreeToggle <CR>
map <Leader>f :NERDTreeFocus <CR>
" let NERDTreeMapJumpNextSibling='l'
let NERDTreeMapJumpPrevSibling='o'
" let NERDTreeMapOpenSplit='s'
let NERDTreeMapActivateNode='m'
let NERDTreeDirArrowsExpandable='l'
let NERDTreeShowHidden=1

" Telescope
nnoremap <C-f> :Telescope find_files cwd=/home/mkovel hidden=true<CR>
map <Leader>s. :Telescope find_files cwd=. <CR>
map <Leader>sh :Telescope find_files cwd=/home/mkovel hidden=true<CR>


" imap <silent><script><expr> <C-Space> copilot#Accept("\<CR>")
imap <silent><script><expr> <Right> copilot#Accept('<Right>')
let g:copilot_no_tab_map = v:true
" Coc.nvim
let g:coc_disable_startup_warning = 1
" S-Tab for autocomplete coc
" imap <expr> <S-Tab> pumvisible() ? coc#_select_confirm() : "<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
" vim.api.nvim_set_keymap( "i", "<C-J>", 'copilot#accept("<CR>")', {silent = true, expr = true})

" goto def/ref
" map <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" keyset ("n", "gd", "<Plug>(coc-definition)", {silent = true})
" keyset ("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
" keyset ("n", "gi", "<Plug>(coc-implementation)", {silent = true})
" keyset ("n", "gr", "<Plug>(coc-references)", {silent = true})


imap <C-q> <Esc>:Commentary<CR>i 
map <C-q> :Commentary<CR>

" Tagbar
nmap <F1> :TagbarToggle<CR>
let g:tagbar_map_togglefold=''

" WhichKey
" Map leader to which_key
noremap <silent> <leader> :WhichKeyVisual ','<CR>
noremap <silent>= :WhichKeyVisual '='<CR>
noremap <silent>C :WhichKeyVisual 'C'<CR>
set timeoutlen=50
" nnoremap <silent> <leader> :silent WhichKey ';'<CR>
" vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual ';'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 1

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Define the mappings
map <Leader>q :q<CR>
map <Leader>v :vs 
map <Leader>h :sp 
map <Leader>t :term<CR>i
map <Leader>b :BookmarkToggle<CR>
map <Leader>m :bnext<CR>

map <Leader>l :bprevious<CR>
map <Leader>; :sp term://zsh<CR>i<CR>
map <Leader>. :vs term://zsh<CR>i<CR>
imap <Leader>; <Esc>:sp term://zsh<CR>i<CR>
imap <Leader>. <Esc>:vs term://zsh<CR>i<CR>
tmap <Leader>. <C-\><C-n>:q<CR>
tmap <Leader>; <C-\><C-n>:q<CR>
tmap <Leader>, <C-\><C-n>

map <Leader>Gp :call CapitalPythonTemplate()<CR>
map <Leader>Gc :call PreInitCpp()<CR>
map <Leader>Gj :call InitClassIfCapJava()<CR>
map <Leader>Gh :call InitClassIfCapHpp()<CR>
map <Leader>Gmp :call MainPythonTemplate()<CR>
map <Leader>Gmc :call MainCppTemplate()<CR>
map <Leader>Gmj :call MainJavaTemplate()<CR>
map <Leader>GMc :call GenerateCMakefile()<CR>
map <Leader>GM+ :call GenerateCppMakefile()<CR>

map <Leader>cj :term mvn clean compile<CR>i
map <Leader>cc :term make<CR>i
map <Leader>cp :term python3 %<CR>i
map <Leader>cb :term 
map <Leader>ct :term mvn test<CR>i
map <Leader>cec :term make run<CR>i
map <Leader>cej :term mvn clean compile exec:java<CR>i

map <Leader>d :NERDTreeToggle <CR>
map <Leader>f :NERDTreeFocus <CR>

map <Leader>s. :Telescope find_files <CR>
map <Leader>sh :Telescope find_files cwd=/home/mkovel <CR>
map <Leader>sH :Telescope find_files cwd=/home/mkovel hidden=true<CR>
map <Leader>S. :Telescope live_grep <CR>
map <Leader>Sh :Telescope live_grep cwd=/home/mkovel <CR>
map <Leader>SH :Telescope live_grep cwd=/home/mkovel hidden=true<CR>
map <Leader>sc :Telescope treesitter<CR>

map <Leader>st :TagbarToggle<CR>

" noremap gd :call CocAction('jumpDefinition')<CR>
" map <Leader>Gd :call CocAction('jumpDefinition')<CR>
map <Leader>Gd <Plug>(coc-definition)
map <Leader>Gr :call CocAction('jumpReferences')<CR>
map <Leader>r :call CocActionAsync('rename') <CR>
map <Leader>Ff <Plug>(coc-fix-current)
map <Leader>Fa :call CocActionAsync('codeAction')<CR>
" Single mappings
let g:which_key_map['/'] = [ '<C-q>'  , 'comment' ]
let g:which_key_map.w = [ 'dw'        , 'Delete word' ]
let g:which_key_map.q = [ '<Esc>'     , 'Exit menu WhichKey' ]
let g:which_key_map.Q = [ 'Q'         , 'Exit (force)' ]
let g:which_key_map.h = [ ',h'        , '╴ split horizontal ...' ]
let g:which_key_map.v = [ ',v'		  , '| split vertical ...' ]
let g:which_key_map.t = [ ',t'        , 'terminal' ]
let g:which_key_map.b = [ ',b'        , 'bookmark' ]
let g:which_key_map.m = [ ',m'        , 'next buffer' ]
let g:which_key_map.l = [ ',l'        , 'previous buffer' ]
let g:which_key_map['.'] = [ ',.'     , '╴ TERM split horizontal' ]
let g:which_key_map[';'] = [ ',;'     , '| TERM split vertical' ]
let g:which_key_map[','] = [ ',,'     , 'Insert mode again' ]
let g:which_key_map.d = [ ',d'        , 'Tree Toogle ' ]
let g:which_key_map.f = [ ',f'        , 'Tree focus' ]
let g:which_key_map.r = [ ',r'        , 'Rename' ]
" let g:which_key_m ap.F = [ ',F'        , 'Fix (quick)' ]

let g:which_key_map.F = {
      \ 'name' : '+Fix' ,
	  \ 'f' : [',Ff'     , 'Quick'],
	  \ 'a' : [',Fa'      , 'Actions'],
	  \ 'q' : ['<Esc>'   , 'Exit menu WhichKey'],
      \ }


let g:which_key_map.V = {
      \ 'name' : '+Goto' ,
	  \ 'd' : [',Gd'     , 'Definition'],
	  \ 'r' : [',Gr'      , 'References'],
	  \ 'q' : ['<Esc>'   , 'Exit menu WhichKey'],
      \ }
" Sub-mappings
let g:which_key_map.S = {
      \ 'name' : '+Search Strings (live_grep)' ,
	  \ '.' : [',S.'     , 'here'],
	  \ 'h' : [',Sh'     , 'home'],
	  \ 'H' : [',SH'     , 'home hidden'],
	  \ 'q' : ['<Esc>'   , 'Exit menu WhichKey'],
      \ }

let g:which_key_map.s = {
      \ 'name' : '+Search Files' ,
	  \ '.' : [',s.'     , 'here'],
	  \ 'h' : [',sh'     , 'home'],
	  \ 'H' : [',sH'     , 'home hidden'],
	  \ 'c' : [',sc'     , 'Class view (treesitter)'],
	  \ 't' : [',st'     , 'Class view (tagbar)'],
	  \ 'q' : ['<Esc>'   , 'Exit menu WhichKey'],
      \ }

let g:which_key_map.c = {
      \ 'name' : '+Compile/Exec Language' ,
	  \ 'j' : [',cj'     , 'Java compile with maven'],
	  \ 'c' : [',cp'     , 'C++ compile with make'],
	  \ 'p' : [',cp'     , 'Python exec'],
	  \ 'q' : ['<Esc>'   , 'Exit menu WhichKey'],
	  \ 'b' : [',cb'    , 'Bash command ...'],
	  \ 't' : [',ct'    , 'Java test with maven'],
      \ }

let g:which_key_map.c.e= {
	  \ 'name' : '+Exec Language' ,
	  \ 'c' : [',cec'    , 'C++ Exec with make'],
	  \ 'j' : [',cej'    , 'Java exec with maven'],
	  \ 'q' : ['<Esc>'   , 'Exit menu WhichKey'],
      \ }

let g:which_key_map.G = {
      \ 'name' : '+GenerateCode Language' ,
      \ 'c' : [',Gc'     , 'CPP source from HPP file'],
	  \ 'p' : [',Gp'     , 'Python class template'],
	  \ 'j' : [',Gj'     , 'Java class template'],
	  \ 'h' : [',Gh'     , 'HPP class template'],
	  \ 'q' : ['<Esc>'   , 'Exit menu WhichKey'],
      \ }
let g:which_key_map.G.m= {
	  \ 'name' : '+MainTemplate Language' ,
	  \ 'p' : [',Gmp'     , 'Python main template'],
	  \ 'c' : [',Gmc'     , 'C++ main template'],
	  \ 'j' : [',Gmj'     , 'Java main template'],
	  \ 'q' : ['<Esc>'    , 'Exit menu WhichKey'],
	  \ }
let g:which_key_map.G.M= {
	  \ 'name' : '+Makefile C/C++' ,
	  \ 'q' : ['<Esc>'    , 'Exit menu WhichKey'],
	  \ 'c' : [',GMc'     , 'C Makefile'],
	  \ '+' : [',GM+'     , 'C++ Makefile'],
	  \ }
map <Leader>gs :term git status<CR>i
let g:which_key_map.g = {
      \ 'name' : '+Git Commands' ,
	  \ 's' : [',gs'     , 'git status'],
	  \ 'c' : [',gc'     , 'git add and commit'],
	  \ 'a' : [',ga'     , 'git add'],
	  \ 'p' : [',gp'     , 'git push'],
	  \ 'q' : ['<Esc>'   , 'Exit menu WhichKey'],
	  \ }

" Register which key map
call which_key#register(',', "g:which_key_map")
let g:which_key_map2 = {}

let g:which_key_map2['C-u'] = [ ''     , 'Move line(s) up' ]
let g:which_key_map2['C-j'] = [ ''     , 'Move line(s) down' ]
let g:which_key_map2['C-a'] = [ ''     , 'Comment line(s)' ]
let g:which_key_map2[','] = [ ''     , 'Leader key' ]
let g:which_key_map2['='] = [ '<Esc>'     , 'Exit menu WhichKey' ]
call which_key#register('=', "g:which_key_map2")

" let g:which_key_map = {}
" let g:which_key_sep = '>'
" let g:which_key_map['v'] = ['vs', 'split vertical']
" call which_key#register('<leader>', "g:which_key_map")
" map <Leader>v :vs 

" set Copilot enable

" nnoremap geh <cmd>Telescope find_files hidden=true<cr>
" map <S-D>  :Telescope find_files hidden=true<CR>

" map <C-Left>  :bprevious<CR>
" map <C-Right> :bnext<CR>


" map <C-Left>  <C-w>h
" map <C-h>  <C-w>h
" map <S-h>  <C-w>h
"




" map <C-Right> <C-w>l
" map <C-l> <C-w>l
" map <S-l> <C-w>l
" map <S-k> <C-w>l

" map <C-Up>  <C-w>k
" map <C-k>  <C-w>k
" map <S-k>  <C-w>k

" map <C-Down>  <C-w>j
" map <C-j>  0
" map <C-ù>  $
" map <S-j>  <C-w>j


" imap <C-Left> <Esc> <C-w>h
" imap <C-h> <Esc> <C-w>h
" imap <C-k> <Esc> <C-w>h

" imap <C-Right> <Esc><C-w>l
" imap <C-l> <Esc><C-w>l
" imap <C-m> <Esc><C-w>l

" imap <C-Up>  <Esc><C-w>k
" imap <C-k>  <Esc><C-w>k
" imap <C-k>  <Esc><C-w>k
" imap <C-o>  <Esc><C-w>k

" imap <C-Down>  <Esc><C-w>j
" imap <C-j>  <Esc><C-w>j
" imap <C-l>  <Esc><C-w>j

" map <C-l> :source %<CR>
" tmap <C-q> <C-\><C-n> :bprevious <CR> :bnext<CR>
" tmap <C-q> <C-\><C-n> :bprevious <CR> :bnext<CR>
" unmap <C-t>

" map <Leader>q :set splitabove<CR> :sp term://zsh<CR>i<CR>:set splitbelow
" map <Leader>s :vs term://zsh<CR>i<CR>
" map <C-Left>  gT
" map <C-Right> gt


" k,e kd,dsf df,sdf,;::;;; f sz

" nmap <leader>Right :bprevious<CR>
" nmap <leader>Left   :bnext<CR>
" nnoremap <SPACE-C> :bprevious<CR>
" nnoremap <SPACE>Left   :bnext<CR>
" nnoremap <silent> <leader>Right :bprevious<CR>
" nnoremap <silent> <leader>Left :bnext<CR>





" test zone 
"1
"2
"3
"4
"5
"6
"7
"----------------
"8
"9
"10














" nnoremap <space-f>     :NERDTreeTabsToggle<CR>
" nnoremap <S-t> :TerminalVSplit zsh<CR>


" nnoremap <C-f> :NERDTreeFocus<CR>
" nnoremap <C-d> :NERDTreeToggle<CR>

" colorscheme dracula


" inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
" nnoremap <esc> :noh<return><esc>

" move lines
" nmap <C-h> :sp temp<CR> 
" inoremap <C-a> <Esc> :Commentary<CR>
" vnoremap <C-a> :Commentary<CR> 

function CapitalPythonTemplate()
    if expand('%:t') =~ '^[A-Z]'
        call setline('.', 'class '.expand('%:t:r').'():')
        call append(line('.'), '    def __init__(self')
        normal G$
    endif
endfunction

function MainPythonTemplate()
	call setline(1, '#!/usr/bin/env python3')
	call setline(2, '')
	call setline(3, 'def main():')
	call setline(4, '	print("Hello World!")')
	call setline(5, '')
	call setline(6, 'if __name__ == "__main__":')
	call setline(7, '	main()')
	normal gg3l$
endfunction

function MainCTemplate()
	call setline(1, '#include <stdio.h>')
	call setline(2, '')
	call setline(3, 'int main(int argc, char *argv[])')
	call setline(4, '{')
	call setline(5, '	printf("Hello World!");')
	call setline(6, '	return 0;')
	call setline(7, '}')
	normal gg5l$
endfunction

function MainCppTemplate()
	call setline(1, '#include <iostream>')
	call setline(2, '')
	call setline(3, 'int main(int argc, char *argv[])')
	call setline(4, '{')
	call setline(5, '	std::cout << "Hello World!" << std::endl;')
	call setline(6, '	return 0;')
	call setline(7, '}')
	normal gg3l$
endfunction

function MainJavaTemplate()
	call setline(1, 'public class '.expand('%:t:r').'{')
	call setline(2, '	public static void main(String[] args) {')
	call setline(3, '		System.out.println("Hello World!");')
	call setline(4, '	}')
	call setline(5, '}')
	normal gg2l$
endfunction

function InitClassIfCapJava()
	if expand('%:t') =~ '^[A-Z]'
	    call setline(1, 'public class '.expand('%:t:r').'{')
	    call setline(2, '	public '.expand('%:t:r').'(){')
	    call setline(3, '		')
	    call setline(4, '	}')
	    call setline(5, '}')
		normal gg2l$
	endif
endfunction

function InitCpp()
		let hppfile = expand('%:p:r').'.hpp'
		if filereadable(hppfile)
			let cmd = 'stubgen -qlgn  ' . expand('%:p:r') . '.hpp'
			call system(cmd)
		endif
endfunction

function PreInitCpp()
	call InitCpp()
	edit %
	normal T 
	normal T 
	call setline(1, '#include "'.expand('%:t:r').'.hpp"')	
	
endfunction
function GenerateCPP()
	execute "w"
	call InitCpp()
	let cppfile = expand('%:t:r').".cpp"
    execute "vs ".fnameescape(cppfile)
endfunction


" CC = gcc

" CFLAGS = -Wall -Wextra -std=c11

" EXEC = main 

" SRC = $(wildcard *.c)

" OBJ = $(SRC:.c=.o)

" all: $(EXEC)

" %.o: %.c
" 	$(CC) -c $(CFLAGS) $< -o $@

" $(EXEC): $(OBJ)
" 	$(CC) $(CFLAGS) $^ -o $@

" clean:
" 	rm -f $(OBJ) $(EXEC)
" run: all
" 	rm -f *.o
" 	./$(EXEC)

" function GenerateCMakefile()
" 	call setline(1, 'CC = gcc')
" 	call setline(2, 'CFLAGS = -Wall -Wextra -std=c11')
" 	call setline(3, 'EXEC = main')
" 	call setline(4, 'SRC = $(wildcard *.c)')
" 	call setline(5, 'OBJ = $(SRC:.c=.o)')
" 	call setline(6, 'all: $(EXEC)')
" 	call setline(7, '%.o: %.c')
" 	call setline(8, '	$(CC) -c $(CFLAGS) $< -o $@')
" 	call setline(9, '$(EXEC): $(OBJ)')
" 	call setline(10, '	$(CC) $(CFLAGS) $^ -o $@')
" 	call setline(11, 'clean:')
" 	call setline(12, '	rm -f $(OBJ) $(EXEC)')
" 	call setline(13, 'run: all')
" 	call setline(14, '	rm -f *.o')
" 	call setline(15, '	./$(EXEC)')
" endfunction



function GenerateMainCorps()
" function GenerateGeneriqueCorpsMakefile()
	call setline(3, '# CPPFLAGS += -Werror')
	call setline(4, '')
	call setline(5, 'EXEC = main')
	call setline(6, 'SRC = $(wildcard *.cpp)')
	call setline(7, 'OBJ = $(SRC:.cpp=.o)')
	call setline(8, '')
	call setline(9, 'all: $(EXEC)')
	call setline(10, '')
	call setline(11, '%.o: %.cpp')
	call setline(12, '	$(CC) -c $(CFLAGS) $< -o $@')
	call setline(13, '')
	call setline(14, '$(EXEC): $(OBJ)')
	call setline(15, '	$(CC) $(CFLAGS) $^ -o $@')
	call setline(16, '')
	call setline(17, 'clean:')
	call setline(18, '	rm -f $(OBJ) $(EXEC)')
	call setline(19, '')
	call setline(20, 'run: all')
	call setline(21, '	rm -f *.o')
	call setline(22, '	./$(EXEC)')
	execute "w"
endfunction

function GenerateCppMakefile()
	call setline(1, 'CC = g++')
	call setline(2, 'CFLAGS = -Wall -Wextra -std=c++17')
	call GenerateMainCorps()
	endfunction

function GenerateCMakefile()
	call setline(1, 'CC = gcc')
	call setline(2, 'CFLAGS = -Wall -Wextra -std=c11')
	call GenerateMainCorps()
endfunction





function InitClassIfCapHpp()
    if expand('%:t') =~ '^[A-Z]'
		call setline(1, '#pragma once')
		" call setline(1, '#ifndef '.toupper(expand('%:t:r')).'_HPP')
		" call setline(2, '#define '.toupper(expand('%:t:r')).'_HPP')
		call setline(2, '')
		call setline(3, '')
		call setline(4, 'class '.expand('%:t:r').'{')
		call setline(5, 'public:')
		call setline(6, '	'.expand('%:t:r').'();')
		call setline(7, '	~'.expand('%:t:r').'();')
		call setline(8, '	')
		call setline(9, '};')
		call setline(10, '')
		" call setline(11, '#endif')
		normal gg8l$
		call GenerateCPP()
	endif
endfunction

augroup initLanguage
    autocmd!
	if !filereadable(expand("%:p"))
		autocmd VimEnter *.py call CapitalPythonTemplate()
		autocmd VimEnter main.py call MainPythonTemplate()
		autocmd VimEnter main.c call MainCTemplate()
		autocmd VimEnter main.cpp call MainCppTemplate()
		autocmd VimEnter Main.java call MainJavaTemplate()
		autocmd VimEnter main.java call MainJavaTemplate()
		autocmd VimEnter *.hpp call InitClassIfCapHpp()
		autocmd VimEnter *.java call InitClassIfCapJava()
		autocmd VimEnter *.cpp call PreInitCpp()
	endif
augroup END
