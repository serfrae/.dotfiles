set -g fish_greeting

abbr -a c cargo
abbr -a cb 'cargo build'
abbr -a cbr 'cargo build --release'
abbr -a cr 'cargo run'
abbr -a ci 'cargo install'
abbr -a ct 'cargo test'
abbr -a g git
abbr -a gc 'git checkout'
abbr -a ga 'git add -p'
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
abbr -a splt2 'spl-token --program-id TokenzQdBNbLqP5VEhdkAS6EPFLC1PHnBqCXEpPxuEb'
abbr -a py "python"

setenv XINITRC ~/.config/X11/xinitrc
setenv XAUTHORITY ~/.config/X11/Xauthority
setenv TERM alacritty
setenv EDITOR nvim 
setenv BROWSER firefox-developer-edition
setenv RUST_BACKTRACE 1

set AI ~/projects/ai/llama.cpp/main
set MODELS ~/projects/ai/models
set NOTES ~/docs/notes/
set DOTFILES ~/.dotfiles
set XDG_CONFIG_HOME $HOME/.config
set XDG_DATA_HOME $HOME/.local/share
set XDG_CACHE_HOME $HOME/.cache
set XDG_STATE_HOME $HOME/.local/state

set -x ELECTRON_OZONE_PLATFORM_HINT auto
set -x GDK_BACKEND wayland

set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x DOCKER_CONFIG $XDG_CONFIG_HOME/docker
set -x GNUPGHOME $XDG_DATA_HOME/gnupg
set -x NODE_REPL_HISTORY $XDG_DATA_HOME/node_repl_history
set -x PYTHON_HISTORY $XDG_STATE_HOME/python/history
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup
set -x VSCODE_PORTABLE $XDG_DATA_HOME/vscode
set -x CUDA_HOME /opt/cuda
set -x LD_LIBRARY_PATH $CUDA_HOME/lib64:$LD_LIBRARY_PATH

set PATH $PATH $CUDA_HOME ~/bin ~/.local/bin ~/.local/share/cargo/bin ~/.local/share/solana/install/active_release/bin ~/.pixi/bin /opt/cuda/bin 

function fish_prompt
	# nix
	set -l nix_shell_info ""
	if test -n "$IN_NIX_SHELL"
		set nix_shell_info "<nix> "
	end
	set_color blue
	echo -n -s "$nix_shell_info"

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
set -gx PNPM_HOME "/home/a7rs/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
