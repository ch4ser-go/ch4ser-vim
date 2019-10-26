# ch4ser-vim
The Neovim configuration file for ctf's web dog

## how to use

### Requirement
```
apt install neovim ccls
pip install jedi

# to install nvm and nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
nvm install stable
nvm alias stable

# to install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### move the repo to ~/.config/nvim

## modify ~/.vim/plugged/onedark.vim/color/onedark.vim to remove background
```
change from:
  if g:onedark_termcolors == 16
    let l:ctermfg = (has_key(s:highlight, "fg") ? s:highlight.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(s:highlight, "bg") ? s:highlight.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(s:highlight, "fg") ? s:highlight.fg.cterm : "NONE")
    let l:ctermbg = (has_key(s:highlight, "bg") ? s:highlight.bg.cterm : "NONE")
  endif

to:
  if g:onedark_termcolors == 16
    let l:ctermfg = (has_key(s:highlight, "fg") ? s:highlight.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(s:highlight, "bg") ? s:highlight.bg.cterm16 : "NONE")
    let l:ctermbg = "NONE"
  else
    let l:ctermfg = (has_key(s:highlight, "fg") ? s:highlight.fg.cterm : "NONE")
    let l:ctermbg = (has_key(s:highlight, "bg") ? s:highlight.bg.cterm : "NONE")
    let l:ctermbg = "NONE"
  endif
```
