##=============================================================================
## [Filename]       probe.tcl
## [Project]        -
## [Author]         Ciro Bermudez
## [Language]       GNU Makefile
## [Created]        Nov 2024
## [Modified]       -
## [Description]    Custom Tcl script to PROBE simulation
## [Notes]          -
## [Status]         stable
## [Revisions]      -
##=============================================================================

# ============================ WAVEFORMS PROBING ============================= #

# Dump all HDL signals and objects to binary Waveform Database (WDB) for later restore
log_wave -r /*

# Create new Wave Window
create_wave_config "Testbench Waveforms"
create_wave_config "DUT Waveforms"

# Add all top-level signals to Testbench Waveform
add_wave [current_scope]/port_a_if/* -into [lindex [get_wave_config] 0]

# Add all top-level signals to DUT Waveform
add_wave [current_scope]/dut/* -into [lindex [get_wave_config] 1]


# ============== VCD SETUP (USEFUL FOR BATCH-MODE SIMULATIONS) =============== #

#set vcdDir [pwd]/vcd

#if { ![file exists ${vcdDir}] } {
#   file mkdir ${vcdDir}
#}

## open VCD file
#open_vcd ${vcdDir}/waveforms.vcd
#
## use 'log_vcd' to select signals to trace
#log_vcd /
