#!/usr/bin/env bash

# ====================== IMPORTANT ======================= #
# THIS IS AN EXAMPLE FILE, PLEASE REPLACE IT WITH YOUR OWN
# SETUP SCRIPT WITH THE NAME setup_synopsys_eda.tcsh
# AND INCLUDE THE TB ENVIRONMENT VARIABLES

# TB Environment Variables
export GIT_ROOT="$(git rev-parse --show-toplevel)"
export UVM_WORK="$GIT_ROOT/work/uvm"
