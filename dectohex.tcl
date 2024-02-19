#!/usr/bin/tclsh

# This program is simple and will convert decimal to hex.

# TCL doesn't have do...while so let's pretend it does with a package.
package require control

# Filter out stupid users.
if { $argc != 1} {
    puts "Please enter exactly one argument."
    exit
}

# Convenient variable.
set original [lindex $argv 0]

# Second filter for stupid users.
if {$original <= 0} {
    puts "Please don't try to divide by zero or convert negative numbers"
    exit
}

# Dictionary for values higher than 9.
set convert [dict create 0 0 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 A 11 B 12 C 13 D 14 E 15 F]

# Case: if the number is lower than 16 (<=15)
if {$original <= 15} {
    puts "Dec $original is hex [dict get $convert $original]"
    exit
}

set converted ""

# Main mathy loop.

# Get a copy of the original
set quotient $original

control::do {
    set remainder [expr $quotient % 16]
    set quotient [expr $quotient /16]

    # append converted $remainder
    append converted [dict get $convert $remainder]

    # Detect end case
    if {[expr $quotient /16] == 0} {
        # One last remainder get
        append converted [expr $quotient % 16]
    }
} while {[expr $quotient / 16] != 0}

puts "Dec $original is hex [string reverse $converted]"
