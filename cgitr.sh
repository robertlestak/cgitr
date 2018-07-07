#!/bin/bash
copyfx=''
if [[ `uname` -eq 'Darwin' ]]; then
	copyfx='pbcopy'
elif [[ `uname` =~ "cygwin"* ]]; then
	copyfx='putclip'
else
	copyfx='xclip'
fi
function gitr () {
	git config --get remote.origin.url | tr -d '\n'
}
function cgitr () {
	gitr | tr -d '\n' | $copyfx
}
if [[ "$0" != "$_" ]]; then
	`cgitr`
fi
