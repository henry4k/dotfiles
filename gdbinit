# vim: set filetype=gdb:

set print address off

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
