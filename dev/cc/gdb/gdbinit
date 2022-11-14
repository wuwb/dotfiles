source $XDG_CONFIG_HOME/gdb/gdbinit-gef.py

# _____________breakpoint aliases_____________
define bpl
    info breakpoints
end
document bpl
List all breakpoints.
end

define sbp
    save breakpoints .gdb_bps
end
document sbp
Save all breakpoints.
end

define lbp
    source .gdb_bps
end
document sbp
Load all breakpoints.
end
