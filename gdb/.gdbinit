define pst
    x/30gx $rbp
end

set auto-load safe-path /
set disassembly-flavor intel

# for sierra
# set startup-with-shell off
#set print pretty on
#set print object on
#set print static-members on
#set print vtbl on
#set print demangle on
#set demangle-style auto
#set print sevenbit-strings off


#define sl
#step
#list
#end
#
#define nl
#step
#list
#end

# gdb >= 8.1 does not work. How to downgrade:
# https://stackoverflow.com/questions/49001329/gdb-doesnt-work-on-macos-high-sierra-10-13-3
#set startup-with-shell off

source ~/dkenv/runtime_config/gdb/gdb-dashboard.gdbinit
#source ~/dkenv/runtime_config/gdb/automate.gdbinit
#dashboard -output /dev/pts/6
dashboard stack -style locals True
dashboard stack -style arguments True

define hookpost-up
dashboard
end

define hookpost-down
dashboard
end

