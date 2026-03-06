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
    # logging.info(f"Inputs YAML:    {args.config}")
    # logging.info(f"Tool selected:  {args.tool}")
    # logging.info(f"Output Path:    {args.output}")

    # Call template generator
    generate_uvc(
        config_path=args.config,
        target_tool=args.tool, 
        output_dir=args.output
    )

if __name__ == "__main__":
    main()
