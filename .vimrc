
" enter the current millenium
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" FINDING FILES: 
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path=.,**

" Display all matching files when we tab complete
set wildmenu
set wildignorecase
set wildmode=longest,list
" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags





" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list





" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings



" BUILD INTEGRATION:

" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix

" Configure the `make` command to run RSpec
" set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back

" Completions using placeholders
inoremap ,, \
inoremap ,. {
inoremap ,- }

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif


"====[ Open any file with a pre-existing swapfile in readonly mode "]=========

    augroup NoSimultaneousEdits
        autocmd!
        autocmd SwapExists * let v:swapchoice = 'o'
        autocmd SwapExists * echomsg ErrorMsg
        autocmd SwapExists * echo 'Duplicate edit session (readonly)'
        autocmd SwapExists * echohl None
        autocmd SwapExists * sleep 2
    augroup END

"-----------
let mapleader = ","
set ignorecase
set smartcase
set gdefault
nnoremap <leader><space> :noh<cr>
set wrap
set textwidth=79
set formatoptions=qrn1
" set colorcolumn=85
" Farbiges Zeichen in Spalte 81
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
au FocusLost * :wa
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" Remapping für Window-Switch
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Remapping für Spellchecker
" nnoremap <F7> :setlocal spell! spell?<CR> 
let g:myLang = 0
let g:myLangList = ['nospell', 'de_de', 'en_us']
function! MySpellLang()
  "loop through languages
  if g:myLang == 0 | setlocal nospell | endif
  if g:myLang == 1 | let &l:spelllang = g:myLangList[g:myLang] | setlocal spell | endif
  if g:myLang == 2 | let &l:spelllang = g:myLangList[g:myLang] | setlocal spell | endif
  echomsg 'language:' g:myLangList[g:myLang]
  let g:myLang = g:myLang + 1
  if g:myLang >= len(g:myLangList) | let g:myLang = 0 | endif
endfunction
map <F7> :<C-U>call MySpellLang()<CR>
" --------------- ENDE VOM SPELLCHECK

let g:tex_no_error=1
set makeprg=xelatex\ -file-line-error
nnoremap <F3> <Esc>:! evince %:r.pdf<CR>
" nnoremap <F5> <Esc>:make % fehler<CR><CR>
set relativenumber

map <ESC>[A <C-Up>
map <ESC>[B <C-Down>
map <ESC>[D <C-Left>
map <ESC>[C <C-Right>
map! <ESC>[A <C-Up>
map! <ESC>[B <C-Down>
map! <ESC>[D <C-Left>
map! <ESC>[C <C-Right>


"Navigating with guides
inoremap <S-Tab> <Esc>/(<>)<Enter>"_c4l
vnoremap <S-Tab> <Esc>/(<>)<Enter>"_c4l
map <S-Tab> <Esc>/(<>)<Enter>"_c4l
"Inserts Placeholder
inoremap ,gui (<>)
"Easy saving
inoremap <F2> <Esc>:w!<Enter>i
nnoremap <F2> :w!<Enter>
"Compile Latex
autocmd FileType tex nnoremap <F5> :w<Enter>:!<Space>xelatex<Space>%<Space><Enter><Enter>

"Spezielle mappings
autocmd FileType tex inoremap ,em \emph{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ,bf \textbf{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ,si \SI{}{(<>)}<Space>(<>)<Esc>2T{i
autocmd FileType tex inoremap ,it \textit{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ,ct \citet{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ,p \citep{}<Space>(<>)<Esc>T{i
"""Logical Symbols
autocmd FileType tex inoremap ,m $$<Space>(<>)<Esc>2T$i
autocmd FileType tex inoremap ,M $$<Esc>i
autocmd FileType tex inoremap ,neg {\neg}
autocmd FileType tex inoremap ,V {\vee}
autocmd FileType tex inoremap ,or {\vee}
autocmd FileType tex inoremap ,L {\wedge}
autocmd FileType tex inoremap ,and {\wedge}
autocmd FileType tex inoremap ,ra {\rightarrow}
autocmd FileType tex inoremap ,la {\leftarrow}
autocmd FileType tex inoremap ,lra {\leftrightarrow}
autocmd FileType tex inoremap ,fa {\forall}
autocmd FileType tex inoremap ,ex {\exists}
autocmd FileType tex inoremap ,dia	{\Diamond}
autocmd FileType tex inoremap ,box	{\Box}
"""END

autocmd Filetype tex inoremap ,nom {\textsc{nom}}
autocmd FileType tex inoremap ,acc {\textsc{acc}}
autocmd FileType tex inoremap ,dat {\textsc{dat}}
autocmd FileType tex inoremap ,gen {\textsc{gen}}
autocmd FileType tex inoremap ,abl {\textsc{abl}}
autocmd FileType tex inoremap ,voc {\textsc{voc}}
autocmd FileType tex inoremap ,loc {\textsc{loc}}
autocmd Filetype tex inoremap ,inst {\textsc{inst}}
"autocmd FileType tex inoremap ;

"""IPA
autocmd FileType tex inoremap ,tipa \textipa{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ,ae {\ae}
autocmd FileType tex inoremap ,A {\textscripta}
autocmd FileType tex inoremap ,dh {\dh}
autocmd FileType tex inoremap ,yogh {\textyogh}
autocmd FileType tex inoremap ,j {\textdyoghlig}
autocmd FileType tex inoremap ,uh {\textschwa}
autocmd FileType tex inoremap ,eps {\textepsilon}
autocmd FileType tex inoremap ,gam {\textgamma}
autocmd FileType tex inoremap ,I {\textsci}
autocmd FileType tex inoremap ,sh {\textesh}
autocmd FileType tex inoremap ,th {\texttheta}
autocmd FileType tex inoremap ,ups {\textupsilon}
autocmd FileType tex inoremap ,ph {\textphi}
autocmd FileType tex inoremap ,om {\textomega}
autocmd FileType tex inoremap ,sig {\textsigma}
autocmd FileType tex inoremap ,oe {\oe}
autocmd FileType tex inoremap ,ng {\ng}
autocmd FileType tex inoremap ,au {\textopeno}
autocmd FileType tex inoremap ,O {\textopeno}
autocmd FileType tex inoremap ,glot {\textglotstop}
autocmd FileType tex inoremap ,ch {\textteshlig}
"""END

