#!/usr/bin/env tcsh

# ====================== IMPORTANT ======================= #
# THIS IS AN EXAMPLE FILE, PLEASE REPLACE IT WITH YOUR OWN
# SETUP SCRIPT WITH THE NAME setup_synopsys_eda.tcsh
# AND INCLUDE THE TB ENVIRONMENT VARIABLES

# TB Environment Variables
setenv GIT_ROOT `git rev-parse --show-toplevel`
setenv UVM_WORK $GIT_ROOT/work/
