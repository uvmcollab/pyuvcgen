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

# Exit on error
set -e

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

# Check python3
if command -v python3 &> /dev/null; then
  printf " > %-8s is INSTALLED\n" "python3"
else 
  printf " > %-8s is NOT INSTALLED\n" "python3"
  echo -e "${C_RED}[ERROR]: Please install Python 3${NC}"
  exit 1
fi

# Check pip
if python3 -m pip --version &> /dev/null 2>&1; then
  printf " > %-8s is INSTALLED\n" "pip"
else 
  printf " > %-8s is NOT INSTALLED\n" "pip"
  echo -e "${C_RED}[ERROR]: pip is not available${NC}"
  echo -e "${C_YEL}[INFO]: Install with: sudo apt install python3-pip${NC}"
  exit 1
fi

# Check venv
if python3 -m venv --help &> /dev/null 2>&1; then
  printf " > %-8s is INSTALLED\n" "venv"
else 
  printf " > %-8s is NOT INSTALLED\n" "venv"
  echo -e "${C_RED}[ERROR]: venv is not available${NC}"
  echo -e "${C_YEL}[INFO]: Install with: sudo apt install python3-venv${NC}"
  exit 1
fi

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

echo -e "${C_ORA}[INFO]: Installing packages${NC}"
python3 -m pip install --upgrade pip
python3 -m pip install -e .

echo -e ""
echo -e "${C_GRE}[SUCCESS]: Environment setup complete!${NC}"
echo -e "${C_ORA}[INFO]: To activate environment run:${NC}"
echo -e "======================================================================================="
echo -e " bash: source $ROOT_DIR/.venv/bin/activate"
echo -e "  csh: source $ROOT_DIR/.venv/bin/activate.csh"
echo -e "======================================================================================="
echo -e ""
