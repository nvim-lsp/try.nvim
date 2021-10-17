tmux new-session -d nvim main.lua \; split-window -h tail -f ~/.cache/nvim/lsp.log \; select-pane -t 0 \; attach
