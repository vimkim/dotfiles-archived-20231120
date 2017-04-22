# Runtime config scripts backup
- .bashrc
- .zshrc
- .vimrc
- .vim
- .inputrc
etc.

## post-commit
put this file into
.git/hooks/
and, after commit, run `git push origin master` automatically. 
*warning*: if working in different branch, this might mess up things.
