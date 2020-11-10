# vim: set filetype=gdb:

set print array on
set print elements 50

set print pretty on

# Use actual object type instead of the pointers type
set print object on


define lf
    info stack
end

define ls
    info stack
end

define lt
    info threads
end

define ll
    info locals
end

define lb
    info breakpoints
end

define lw
    info watchpoints
end

define fin
    finish
end


# Reverse:

set record stop-at-limit off

define rs
    reverse-step
end

define rn
    reverse-next
end

#define rc
#    reverse-continue
#end

define rfin
    reverse-finish
end

define forward
    set exec-direction forward
end

define reverse
    set exec-direction reverse
end
