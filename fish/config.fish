set -g fish_greeting

abbr -a at 'anchor test'
abbr -a c cargo
abbr -a cb 'cargo build'
abbr -a cbr 'cargo build --release'
abbr -a cr 'cargo run'
abbr -a ci 'cargo install --path .'
abbr -a ct 'cargo test'
abbr -a g git
abbr -a gc 'git checkout'
abbr -a gcb 'git checkout -b'
abbr -a ga 'git add -p'
abbr -a gp 'git pull origin --rebase --autostash'
abbr -a rgp 'rg -p'
abbr -a rgr 'rg -uuu'
abbr -a nn note
abbr -a nf note_find
abbr -a nj note_journal
abbr -a v nvim
abbr -a vi nvim
abbr -a vim nvim
abbr -a ve 'source .venv/bin/activate.fish > /dev/null || source venv/bin/activate.fish > /dev/null'
abbr -a vd 'deactivate'
abbr -a fzp 'fzf --preview "bat --color=always --style=header,grid --line-range :500 {}"'
abbr -a uv 'uv pip'
abbr -a pip 'uv pip'
abbr -a hypr 'Hyprland'
abbr -a spl-t2 'spl-token --program-id TokenzQdBNbLqP5VEhdkAS6EPFLC1PHnBqCXEpPxuEb'
abbr -a py "python"

setenv TERM alacritty
setenv EDITOR nvim 
setenv BROWSER firefox-developer-edition
setenv RUST_BACKTRACE 1

set NOTES ~/docs/notes/
set DOTFILES ~/.dotfiles
set XDG_CONFIG_HOME $HOME/.config
set XDG_DATA_HOME $HOME/.local/share
set XDG_CACHE_HOME $HOME/.cache
set XDG_STATE_HOME $HOME/.local/state

set -x ELECTRON_OZONE_PLATFORM_HINT auto
set -x GDK_BACKEND wayland

set -x RUSTUP_HOME $XDG_DATA_HOME/rustup
set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x RUST_LOG info 
set -x GOPATH $XDG_DATA_HOME/go
set -x GOMODCACHE $XDG_CACHE_HOME/go/pkg/mod
set -x DOCKER_CONFIG $XDG_CONFIG_HOME/docker
set -x GNUPGHOME $XDG_DATA_HOME/gnupg
set -x NODE_REPL_HISTORY $XDG_DATA_HOME/node_repl_history
set -x PYTHON_HISTORY $XDG_STATE_HOME/python/history
set -gx PNPM_HOME $XDG_DATA_HOME/pnpm
set -x AVM_HOME $XDG_DATA_HOME/avm
set -x AGAVE $XDG_DATA_HOME/agave/target/debug
set -x SOLANA_SDK_PATH $XDG_DATA_HOME/solana/install/active_release/bin/solana/sdk

set PATH $PATH $RUSTUP_HOME $CARGO_HOME/bin $AGAVE $GOPATH/bin $AVM_HOME $AVM_HOME/bin ~/bin ~/.local/bin ~/.local/share/solana/install/active_release/bin ~/.pixi/bin

function fish_prompt
    set_color white
    echo -n "["(date "+%H:%M")"] "
    set_color blue
    echo -n (hostnamectl hostname)
    if [ $PWD != $HOME ]
        set_color magenta
        echo -n ':'
        set_color yellow
        echo -n (basename $PWD)
    end
    set -g __fish_git_prompt_show_informative_status 1
    set -g __fish_git_prompt_showupstream 'informative'
    set -g __fish_git_prompt_showstashstate 1
    set -g __fish_git_prompt_showcolorhints 1
    set_color green
    printf '%s ' (__fish_git_prompt)
    set_color red
    echo -n '> '
    set_color normal
end

set __fish_git_prompt_showuntrackedfiles yes
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream none
set -g fish_prompt_pwd_dir_length 3

if command -v paru >/dev/null
    abbr -a p paru
else
    abbr -a p 'sudo pacman'
end

if command -v eza >/dev/null
    abbr -a l eza
    abbr -a ls eza
    abbr -a ll 'eza -l'
    abbr -a lll 'eza -la'
	abbr -a lt 'eza -T'
	abbr -a lti 'eza -Ti'
else
    abbr -a l ls
    abbr -a ll 'ls -l'
    abbr -a lll 'ls -la'
end

function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
end

pixi completion --shell fish | source
zoxide init fish --cmd j | source

# pnpm
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$XDG_DATA_HOME/bun"
set --export PATH $BUN_INSTALL/bin $PATH
