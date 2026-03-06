##=============================================================================
## [Filename]       run.tcl
## [Project]        {{ name }}
## [Author]         {{ author }} - {{ email }}
## [Language]       Tcl (Tool Command Language)
## [Created]        {{ created }}
## [Modified]       -
## [Description]    Tcl file fo run simulation
## [Notes]          -
## [Status]         stable
## [Revisions]      -
##=============================================================================

# Dump signals to FSDB (RECOMMENDED)
dump -file novas.fsdb -type FSDB
dump -add top.DUT -depth 1 -ports -fid FSDB0
run
quit

# Dumps everything from root including complex data type 
# dump -file novas.fsdb -type FSDB
# dump -add / -aggregates
# run
# quit
