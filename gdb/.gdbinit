#set startup-with-shell off
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
