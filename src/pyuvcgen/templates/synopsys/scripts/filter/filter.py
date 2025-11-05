#!/usr/bin/env python3

##=============================================================================
## [Filename]       filter.py
## [Project]        
## [Author]         Ciro Bermudez - cirofabian.bermudezmarquez@ba.infn.it
## [Language]       Python 3.9.21
## [Created]        Jan 2025
## [Modified]       -
## [Description]    Python script to filter the UVM logs
## [Notes]          -
## [Status]         stable
## [Revisions]      -
##=============================================================================

import sys
import re
import argparse
import logging
from pathlib import Path

def extract_logs(log_path: Path, out_path: Path, str_input: str) -> None:

    logging.info(f"INPUTS:")
    logging.info(f"log_path:  {log_path}")
    logging.info(f"out_path:  {out_path}")
    logging.info(f"str_input: {str_input}")

    pattern = rf"\[{str_input}\] $"
    re_obj = re.compile(pattern)
    enable_print = False
    
    if not log_path.is_file():
        logging.error(f"{log_path} does not exist or is not a file.")
        sys.exit(1)

    with log_path.open("r", encoding="utf-8") as fin, out_path.open("w", encoding="utf-8") as fout:
        for line in fin:
            if line.startswith("UVM_INFO"):
                enable_print = False

            if re_obj.search(line):
                enable_print = True

            if enable_print:
                #print(line.strip())
                fout.write(line)


def main() -> None:
    parser = argparse.ArgumentParser(description="Python Utility for UVM Logs")

    parser.add_argument(
        "-i",
        "--input",
        type=Path,
        required=True,
        help="input log file"
    )

    parser.add_argument(
        "-o",
        "--output",
        type=Path,
        required=True,
        help="output filter log file"
    )

    parser.add_argument(
        "-s",
        "--string",
        type=Path,
        required=True,
        help="input string"
    )

    args = parser.parse_args()

    logging.basicConfig(
        level=logging.INFO,
        format="[%(levelname)s]: %(message)s"
    )
    
    extract_logs(log_path=args.input, out_path=args.output, str_input=args.string)

if __name__ == "__main__":
    main()
