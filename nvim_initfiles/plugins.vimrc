"section============================================================================
" PLUGINS
"===================================================================================

"Discard all ancient vi settings.
set nocompatible

"(For Pathogen, "This is what you should have at the top of your ~/.vimrc" - by romainl
filetype off
filetype plugin indent off
syntax off
"Now go down to the plugin section and see these turned on.
")

"(PATHOGEN << not used anymore.
"Not using pathogen anymore. Changed to "vimplug.
""let g:pathogen_disabled=['neocomplete.vim']
""execute pathogen#infect()
"If this is executed, helptags of plugins are updated.
""execute pathogen#helptags()
"* IMPORTANT: It is required that the user should run :Helptags command everytime a new plugin is installed. This method helps trigger :help <plugin_name> function. -by tpope, the creater of pathogen
")


"(VIMPLUG
"To install, type :
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"use :sort /.... '.*\// to sort the lines.
function! DoRemote(arg)
    UpdateRemotePlugins
endfunction

" CALL VIMPLUG
if has('nvim')
    call plug#begin('$HOME/.config/nvim/plugged')
else
    call plug#begin('$HOME/dkenv/.vim/plugged')
endif
if !empty(glob("$HOME/dkenv/runtime_config/nvim_initfiles/plugins")) "glob expands $HOME. Necessary? IDK..

    " plugin lists modularized
    so ~/dkenv/runtime_config/nvim_initfiles/plugins/autocompletion.vim
    so ~/dkenv/runtime_config/nvim_initfiles/plugins/plugins1.vim " name does not start with vim
    so ~/dkenv/runtime_config/nvim_initfiles/plugins/plugins2.vim " name starts with vim
    so ~/dkenv/runtime_config/nvim_initfiles/plugins/language_specific.vim
    so ~/dkenv/runtime_config/nvim_initfiles/plugins/markdown.vim
    so ~/dkenv/runtime_config/nvim_initfiles/plugins/latex.vim
    so ~/dkenv/runtime_config/nvim_initfiles/plugins/conceal.vim


endif
call plug#end()
")

so ~/dkenv/runtime_config/nvim_initfiles/plugins/plugin_settings.vim

""" filetype on
""" filetype plugin indent on
""" syntax on
