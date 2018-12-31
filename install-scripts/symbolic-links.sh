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
