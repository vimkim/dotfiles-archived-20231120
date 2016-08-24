#!/usr/bin/zsh

for i in ~/.vim/bundle/*;
do
    git -C $i pull;
done


