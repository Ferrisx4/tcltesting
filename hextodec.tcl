#!/usr/bin/tclsh

# This program is simple and will convert hex to decimal.

# Filter out stupid users.
if { $argc != 1} {
    puts "Please enter exactly one argument."
    exit
}

# Convenient variable.
set original [lindex $argv 0]

# Dictionary for values higher than 9.
set convert [dict create 0 0 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 A 10 B 11 C 12 D 13 E 14 F 15]
# Get length of the input.
set length [string length $original]

# Trim garbage from ends.
set original [string trim $original]

# Make it all uppercase because reasons.
set original [string toupper $original]

# Start at 0 for powers.
set power 0

# Set sum equal to 0 as well
set sum 0

while {$length > 0} {
    # puts "length: [string index $original [expr $length - 1]]"
    set current [string index $original [expr $length - 1]]

    # Convert current to be dec only (no A-F)
    set current [dict get $convert $current]
    # puts "Current: $current"
    set sum [expr $current * 16**$power + $sum]

    incr length -1
    incr power 1
}

puts "Hex $original is dec $sum"