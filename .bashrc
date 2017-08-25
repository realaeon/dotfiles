#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias em="emacs"
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$'
export http_proxy='http://127.0.0.1:8087'
