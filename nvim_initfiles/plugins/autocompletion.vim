Plug 'neoclide/coc.nvim', {'branch': 'release'}

" YouCompleteMe
" https://github.com/Valloric/YouCompleteMe/issues/1751
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

" By default, do not install YCM cuz it's too large.
" You can install it when you add a file named ycm_install.txt in .vim
" directory.
if filereadable($HOME."/dkenv/.vim/ycm_install.txt")
    Plug 'Valloric/YouCompleteMe'
    ", { 'do': function('BuildYCM') }
    " - python: pip install jedi
    " - javascript: npm install -g typescript
    "   and add jsconfig.json in the project root

    "(YouCompleteMe Settings
    " TIP: YCM has two completer: identifier and semantic. Use ctrl-space to trigger the `semantic` one.
    let g:ycm_key_list_select_completion = ['<Down>'] "Default: ['<TAB>', '<Down>'] <- key to cycle through list
    let g:ycm_key_list_select_previous_completion = ['<Up>'] "Default: ['<S-TAB>', '<Up>'] *<S-TAB> only works in GUI
    let g:ycm_key_list_stop_completion = ['<C-y>'] "Default: ['<C-y'] *written as useful for ultisnips
    let g:ycm_key_invoke_completion = '<C-Space>' " for `semantic` completion, not identifier. In c-family, ., ->, :: works. Useful for searching for top-level functions & classes.
    let g:ycm_global_ycm_extra_conf = '~/runtime_config/vim/.ycm_extra_conf_general.py'

    if has('mac')
         let g:ycm_python_binary_path = '/usr/local/bin/python3'
         " if python does not work, pip install jedi
    endif
    let g:ycm_confirm_extra_conf = 0 "Default: 1
    let g:ycm_add_preview_to_completeopt = 0 "default 0
    " Options:
    let g:ycm_min_num_of_chars_for_completion = 2 "(default 2)
    let g:ycm_auto_trigger = 1 "(default 1) "YCM has two triggers: identifier completer (as-you-type) and semantic trigger (i.e. . or -> in c++). If this option is set to 0, both triggers are disabled.
    "let g:ycm_filetype_blacklist
    "let g:ycm_filetype_whitelist
    let g:ycm_error_symbol = '->' "default '>>'
    let g:ycm_warning_symbol = '<<' "default '>>'
    let g:ycm_collect_identifiers_from_tags_files = 1 "default 0
    ")
    "(YouCompleteMe
    " TIP: YCM has two completer: identifier and semantic. Use ctrl-space to trigger the `semantic` one.
    let g:ycm_key_list_select_completion = ['<Down>'] "Default: ['<TAB>', '<Down>'] <- key to cycle through list
    let g:ycm_key_list_select_previous_completion = ['<Up>'] "Default: ['<S-TAB>', '<Up>'] *<S-TAB> only works in GUI
    let g:ycm_key_list_stop_completion = ['<C-y>'] "Default: ['<C-y'] *written as useful for ultisnips
    let g:ycm_key_invoke_completion ='<C-Space>' " for `semantic` completion, not identifier. In c-family, ., ->, :: works. Useful for searching for top-level functions & classes.
    let g:ycm_global_ycm_extra_conf = '~/runtime_config/vim/.ycm_extra_conf_general.py'

    let plat=$platform
    if plat == 'linux'
        "let g:ycm_python_binary_path = '/usr/bin/python3' "not working?
    elseif plat == 'macos'
        let g:ycm_python_binary_path = '/usr/local/bin/python3'
    else
        "check this!"
    endif
    let g:ycm_confirm_extra_conf = 0 "Default: 1
    let g:ycm_add_preview_to_completeopt = 0 "default 0
    " Options:
    let g:ycm_min_num_of_chars_for_completion = 2 "(default 2)
    let g:ycm_auto_trigger = 1 "(default 1) "YCM has two triggers: identifier completer (as-you-type) and semantic trigger (i.e. . or -> in c++). If this option is set to 0, both triggers are disabled.
    "let g:ycm_filetype_blacklist
    "let g:ycm_filetype_whitelist
    let g:ycm_error_symbol = '->' "default '>>'
    let g:ycm_warning_symbol = '<<' "default '>>'
    let g:ycm_collect_identifiers_from_tags_files = 1 "default 0
    ")
else
    Plug 'maralla/completor.vim'
endif

Plug 'rdnetto/YCM-Generator', { 'branch' : 'stable' }


