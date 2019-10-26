# ch4ser-vim
The Neovim configuration file for ctf's web dog, works well on Windows (WSL).
![image](https://user-images.githubusercontent.com/40637063/67621473-90a87580-f842-11e9-9661-2c8556a570c7.png)

## how to use

### Requirement
```
install neovim ,ccls(for clang completion) and jedi(for python completion)
apt install neovim ccls
pip install jedi

# to install nvm and nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
nvm install stable
nvm alias stable

# to install vim-plug (vim plugins manager)
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### move the repo to ~/.config/nvim

### modify ~/.vim/plugged/onedark.vim/color/onedark.vim to remove background
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

### If you are using WSL or other ternimal that can modify background, you can use the wallpaper given in the repo or what ever you like.
