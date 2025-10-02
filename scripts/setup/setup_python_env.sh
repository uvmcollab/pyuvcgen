#!/usr/bin/env bash

##=============================================================================
## [Filename]       setup_python_env.sh      
## [Project]        pyuvcgen
## [Author]         Ciro Bermudez
## [Language]       Bash Scripting
## [Created]        Jan 2025
## [Modified]       -
## [Description]    Bash script to generate Python environment
## [Notes]          -
## [Status]         stable
## [Revisions]      -
##=============================================================================

# Get locations
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR=$(pwd)

# Colors
C_RED='\033[31m'
C_GRE='\033[32m'
C_BLU='\033[34m'
C_YEL='\033[33m'
C_ORA='\033[38;5;214m'
NC='\033[0m'

echo -e "${C_ORA}[INFO]: Checking dependencies${NC}"
DEPENDENCIES=("python3")
for item in "${DEPENDENCIES[@]}"; do
  if command -v $item &> /dev/null; then
    printf " > %-8s is INSTALLED\n" "$item"
  else 
    printf " > %-8s is NOT INSTALLED\n" "$item"
    exit 1
  fi
done
echo -e " > All dependencies found"

echo -e "${C_ORA}[INFO]: Checking Active Environment${NC}"
if [ -n "${VIRTUAL_ENV}" ]; then
  echo "[ERROR]: You are running from inside a virtual environment!"
  echo "[ERROR]: Run 'deactivate' and retry"
  exit 1
else
  echo " > Virtual Environment not Active"
fi

echo -e "${C_ORA}[INFO]: Creating Virtual Environment${NC}"
rm -rf .venv
python3 -m venv .venv
source .venv/bin/activate
set +e
pip install --upgrade pip
pip install -e .
set -e

echo -e ""
echo -e "${C_ORA}[INFO]: To activate environment run:${NC}"
echo -e "======================================================================================="
echo -e " bash: source $ROOT_DIR/.venv/bin/activate"
echo -e "  csh: source $ROOT_DIR/.venv/bin/activate.csh"
echo -e "======================================================================================="
echo -e ""
