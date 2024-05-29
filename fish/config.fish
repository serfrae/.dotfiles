abbr -a c cargo
abbr -a cb 'cargo build'
abbr -a cbr 'cargo build --release'
abbr -a cr 'cargo run'
abbr -a ci 'cargo install'
abbr -a ct 'cargo test'
abbr -a g git
abbr -a gc 'git checkout'
abbr -a ga 'git add -p'
abbr -a hx helix
abbr -a rgp 'rg -p'
abbr -a rgr 'rg -uuu'
abbr -a p pnpm
abbr -a nn note
abbr -a nf note_find
abbr -a nj note_journal

setenv XINITRC ~/.config/X11/xinitrc
setenv XAUTHORITY ~/.config/X11/Xauthority
setenv TERM alacritty
setenv EDITOR nvim 
setenv BROWSER firefox-developer-edition
setenv RUST_BACKTRACE 1
set AI ~/projects/ai/llama.cpp/main
set MODELS ~/projects/ai/models
set NOTES ~/docs/notes/

set PATH $PATH ~/bin ~/.local/bin ~/.cargo/bin ~/.local/share/solana/install/active_release/bin

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
    abbr -a up 'paru -Syu'
else
    abbr -a p 'sudo pacman'
    abbr -a up 'sudo pacman -Syu'
end

if command -v eza >/dev/null
    abbr -a l eza
    abbr -a ls eza
    abbr -a ll 'eza -l'
    abbr -a lll 'eza -la'
else
    abbr -a l ls
    abbr -a ll 'ls -l'
    abbr -a lll 'ls -la'
end

function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
end
