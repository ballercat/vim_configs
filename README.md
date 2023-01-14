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

`~/.tmux.conf`

```
# remap prefix
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

# vi bindings
setw -g mode-keys vi

set -g default-shell $SHELL
set -g default-command "reattach-to-user-namespace -l ${SHELL}"

set -as terminal-overrides ',xterm*:sitm=\E[3m'
set -g default-terminal "tmux"

#set -as terminal-overrides ',xterm*:sitm=\E[3m'

# copy to clipboard from vi-mode
#bind -t vi-copy y copy-pipe 'pbcopy -in -selection clipboard'
bind-key -Tcopy-mode-vi 'v' send -X begin-selection
bind-key -Tcopy-mode-vi 'y' send -X copy-selection
# bind-key -Tcopy-mode-vi 'y' send -X copy-pipe "reattach-to-user-namespace pbcopy"

# enable mouse scrolling
set-option -g mouse on

# smart pane switching with awareness of vim splits
bind -n C-h run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-h) || tmux select-pane -L"
bind -n C-j run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-j) || tmux select-pane -D"
bind -n C-k run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-k) || tmux select-pane -U"
bind -n C-l run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-l) || tmux select-pane -R"
# bind -n C-\ run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys 'C-\\') || tmux select-pane -l"

# Set new panes to open in current directory
bind c new-window -c "#{pane_current_path}"
bind '"' split-window -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"
```

