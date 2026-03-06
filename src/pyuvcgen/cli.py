import logging
from .generator import generate_uvc
from .parser import build_parser

def main() -> None:

    # Setup Logging
    logging.basicConfig(
        level=logging.INFO,
        format="[%(levelname)s]: %(message)s",
    )
    
    # Parse command-line arguments
    args = build_parser()

    # Log generation info
    logging.info("Starting UVC generation")

    # Call template generator
    generate_uvc(
        config_path=args.input,
        target_tool=args.tool, 
        output_dir=args.output,
        mode=args.mode
    )

if __name__ == "__main__":
    main()
