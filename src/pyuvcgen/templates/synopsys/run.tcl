##=============================================================================
## [Filename]       run.tcl
## [Project]        {{ name }}
## [Author]         {{ author }} - {{ email }}
## [Language]       Tcl (Tool Command Language)
## [Created]        Nov 2024
## [Modified]       -
## [Description]    Tcl file fo run simulation
## [Notes]          -
## [Status]         stable
## [Revisions]      -
##=============================================================================

fsdbDumpvars 0 "tb" +all +trace_process
run
