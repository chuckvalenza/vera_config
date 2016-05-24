#!/usr/bin/tclsh
# No trailing whitespace

set strictMode [getParameter "strict-trailing-space" 1]

foreach f [getSourceFileNames] {
    set lineNumber 1
    set previousIndent ""
    foreach line [getAllLines $f] {

        if [regexp {^.*[[:space:]]+$} $line] {
            if {$strictMode || [string trim $line] != "" || $line != $previousIndent} {
                if ![regexp {[[:space:]]*[[:space:]]+$} $line] {
                    report $f $lineNumber "trailing whitespace"
                }
            }
        }

        regexp {^([[:space:]]*).*$} $line dummy previousIndent
        incr lineNumber
    }
}
