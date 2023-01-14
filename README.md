# Vim Configs

Using `vim-plug`.

## Install

Clone

```
git clone git@github.com:ballercat/vim_configs.git .vim_runtime
```

Update `.vimrc`

```
cat <<EOT >> .vimrc

set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

source ~/.vim_runtime/my_configs.vim
EOT
```


