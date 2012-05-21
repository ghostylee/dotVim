#my vimrc used across windows and linux
## Install
### Linux
1.backup your .vim and .vimrc
```
cp ~/.vimrc ~/.vim && mv ~/.vim ~/.vim_old
```
2.git clone
```
git clone https://github.com/ghostylee/dotVim.git ~/.vim
```
3.create link to vimrc
```
ln -sfn ~/.vim/vimrc .vimrc
```
4.install `Vundle`
```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```
5.install plugins with `Vundle`
Launch `vim`, run `:BundleInstall`
### Windows
1.backup your ~/.vim(if you got one)
```
 mv ~/.vim ~/.vim_old
```
2.git clone
```
    git clone https://github.com/ghostylee/dotVim.git ~/.vim
```
3.add this to $VIMRUNTIME/_vimrc
```
    source ~/.vim/vimrc
```
4.install `Vundle`
```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```
to make vundle work in windows, you may take a look at [Vundle for Windows](https://github.com/gmarik/vundle/wiki/Vundle-for-Windows)
5.install plugins with `Vundle`
Launch `vim`, run `:BundleInstall`
