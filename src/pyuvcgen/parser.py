import argparse
from importlib.metadata import version
from pathlib import Path

class CustomHelpFormatter(argparse.RawTextHelpFormatter):
    def __init__(self, prog):
        super().__init__(prog, max_help_position=40, width=120)

def build_parser():
    parser = argparse.ArgumentParser(
        prog="pyuvcgen",
        description="""
[UVMCOLLAB]
UVM-UVC Code Generator - Generate Universal Verification Components from YAML configuration""",
        formatter_class=CustomHelpFormatter,
        epilog="""
Examples:
    pyuvcgen -c config.yaml
    pyuvcgen -c config.yaml -t vivado
    pyuvcgen -c config.yaml -t synopsys -o output_uvc""",
    )

    parser.add_argument(
        "-c",
        "--config",
        type=Path,
        required=True,
        metavar="FILE",
        help="YAML configuration file path",
    )

    parser.add_argument(
        "-t",
        "--tool",
        type=str,
        metavar="TOOL",
        default="synopsys",
        choices=["synopsys", "vivado", "cadence"],
        help="Target EDA tool/vendor for UVC generation (choices: synopsys, vivado) [default: synopsys]",
    )

    parser.add_argument(
        "-o",
        "--output",
        type=Path,
        metavar="DIR",
        default=Path("generated_uvc"),
        help="Output directory for generated UVC files [default: generated_uvc]",
    )

    parser.add_argument(
        "-v", "--version",
        action="version",
        version=f"%(prog)s {version('pyuvcgen')}"
    )

    args = parser.parse_args()
    
    return args
