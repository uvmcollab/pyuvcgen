##=============================================================================
## [Filename]       run.tcl
## [Project]        -
## [Author]         Ciro Bermudez
## [Language]       GNU Makefile
## [Created]        Nov 2024
## [Modified]       -
## [Description]    Custom Tcl script to run simulation
## [Notes]          -
## [Status]         stable
## [Revisions]      -
##=============================================================================

# Profiling
set tclStart [clock seconds]

# Scripts directory
set scriptsDir [file normalize [file dirname [info script]]]
puts "This script is located in: $scriptsDir"

# Load into XSim Tcl environment the custom 'relaunch' procedure
#if { [info procs relaunch] eq "" } {
#  source -notrace -quiet ${scriptsDir}/sim/relaunch.tcl
#}

# ============================= WAVEFORMS SETUP ============================== #

# Choose signal displayed in the Wave window or dumped into a VCD file (dedicated script)
if { [file exists ${scriptsDir}/probe.tcl] } {
  source -notrace -quiet ${scriptsDir}/probe.tcl
}

# ============================ RUN THE SIMULATION ============================ #

# Run the simulation until a $finish or $stop statement is reached
run all

# Flush and close Value Change Dump (VCD) database (if any)
if { [current_vcd -quiet] != ""} {
  flush_vcd [current_vcd]
  close_vcd [current_vcd]
}

# Print overall simulation tine on XSim console
puts "\[INFO\]: Simulation finished at [current_time]"

# ============================= CPU REPORT TIME ============================== #

set tclStop [clock seconds]
set seconds [expr ${tclStop} - ${tclStart} ]
puts "\[INFO\]: Total elapsed-time for RUN: [format "%6.2f" [expr $seconds/1.0]] seconds"
