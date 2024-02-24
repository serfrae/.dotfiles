abbr -a c 'cargo'
abbr -a cb 'cargo build'
abbr -a cbr 'cargo build --release'
abbr -a cr 'cargo run'
abbr -a ci 'cargo install'
abbr -a cnb 'cargo new'
abbr -a cnl 'cargo new --lib'
abbr -a ct 'cargo test'

abbr -a g 'git'
abbr -a gc 'git checkout'
abbr -a ga 'git add -p'

abbr -a hx 'helix'

abbr -a rgp 'rg -p'
abbr -a rgr 'rg -uuu'

setenv XINITRC ~/.config/X11/xinitrc
setenv XAUTHORITY ~/.config/X11/Xauthority

set PATH $PATH ~/bin ~/.local/bin ~/.cargo/bin

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

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

if command -v eza > /dev/null
	abbr -a l 'eza'
	abbr -a ls 'eza'
	abbr -a ll 'eza -l'
	abbr -a lll 'eza -la'
else
	abbr -a l 'ls'
	abbr -a ll 'ls -l'
	abbr -a lll 'ls -la'
end
