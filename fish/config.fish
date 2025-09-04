# greeting messag
set -gx FISH_GREETING ""
set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

bind --mode insert ctrl-l accept-autosuggestion

# vi
set -g fish_key_bindings fish_vi_key_bindings

set -Ux SERVER_APPS_DIR ubuntu@ec2-54-237-241-187.compute-1.amazonaws.com:apps/
set -Ux CLOUD_SERVER ubuntu@ec2-54-237-241-187.compute-1.amazonaws.com
# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias c claude
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -x NVM_DIR ~/.nvm

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/fish_variables.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

set --universal nvm_default_version v24.0.0

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME /Users/syed/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
export PATH="/usr/local/opt/curl/bin:$PATH"
