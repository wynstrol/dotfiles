#!/bin/bash

script_dir=$(cd $(dirname $0) && pwd)
source ${script_dir}/common.sh

dotfiles_dir=$(cd ${script_dir}/.. && pwd)

function _link() {

	local target=$1
	local link=$2
	info "Creating link '${link}' with target '${target}'"
	rm -f ${link} && ln -s ${target} ${link}
}

info "Creating Symbolic links"
_link ${dotfiles_dir}/.vimrc $HOME/.vimrc
_link ${dotfiles_dir}/.gitconfig $HOME/.gitconfig
_link ${dotfiles_dir}/.tmux.conf $HOME/.tmux.conf
# _link ${dotfiles_dir}/.zshrc $HOME/.zshrc
# _link ${dotfiles_dir}/.config/autostart/xmodmap.desktop $HOME/.config/autostart/xmodmap.desktop
# _link ${dotfiles_dir}/.Xmodmap $HOME/.Xmodmap
mkdir -p $HOME/.vim/colors/
_link ${dotfiles_dir}/.vim/colors/monokai-soda.vim $HOME/.vim/colors/monokai-soda.vim
_link ${dotfiles_dir}/.vim/coc-settings.json $HOME/.vim/coc-settings.json

echo "should setup zshi"
${dotfiles_dir}/zsh/setupZshLinks.sh

