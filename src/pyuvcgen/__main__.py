import argparse
import logging
from pathlib import Path
from .generator import generate_uvc


class CustomHelpFormatter(argparse.RawTextHelpFormatter):
    def __init__(self, prog):
        super().__init__(prog, max_help_position=40, width=120)


def main() -> None:
    script_path = Path(__file__).resolve()
    script_dir = script_path.parent

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
        # default=script_dir / "yaml/uvc.yaml",
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

    args = parser.parse_args()

    logging.basicConfig(
        level=logging.INFO,
        format="[%(levelname)s]: %(message)s",
    )

    logging.info("Starting UVC generation")

    generate_uvc(
        config_path=args.config, target_tool=args.tool, output_dir=args.output
    )


if __name__ == "__main__":
    main()
