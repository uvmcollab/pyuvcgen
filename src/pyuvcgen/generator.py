from pathlib import Path
import shutil
import yaml
import jinja2
import logging

logger = logging.getLogger(__name__)

def generate_uvc(
    config_path: Path,
    target_tool: str,
    output_dir: Path
) -> None:
    """
    Generate UVM-UVC code from a YAML config and Jinja2 templates.
    """
    
    # Determine templates directory based on target tool
    proj_path = Path(__file__).resolve()
    src_dir = proj_path.parent

    # Default directory
    uvc_template_dir = src_dir / "templates/uvc_template"
    tool_dir = src_dir / "templates" / target_tool
    templates_dir = [uvc_template_dir, tool_dir]
        
    # Load YAML configuration
    data = yaml.safe_load(config_path.read_text(encoding="utf-8"))
    uvc_name = data["name"]
    
    # Define output directory
    dest_root = output_dir / uvc_name
    if dest_root.exists():
        shutil.rmtree(dest_root)
    dest_root.mkdir(parents=True)
    
    # Log generation info
    logging.info(f"Generating UVC: {uvc_name}")
    logging.info(f"Config Path:    {config_path}")
    logging.info(f"Target tool:    {target_tool}")
    logging.info(f"Output Dir:     {output_dir}")
    
    # Setup Jinja2 environment
    env = jinja2.Environment(
        loader=jinja2.FileSystemLoader([str(dir) for dir in templates_dir])
    )
    
    # Process each template file from base uvc_template
    for dir_path in templates_dir:
        for tmpl in dir_path.rglob("**/*"):
            if tmpl.is_file():
                # Apply template
                rel = tmpl.relative_to(dir_path)
                template_name = rel.as_posix()
                content = env.get_template(template_name).render(**data)

                # Create output subdirectory
                out_subdir = dest_root / rel.parent
                out_subdir.mkdir(parents=True, exist_ok=True)
                name = rel.name
                
                # Adjust file naming conventions
                if rel.parent.as_posix() in {"sv", "sv/seqlib"}:
                    name = f"{uvc_name}_{name}"
                elif rel.name == "uvc.f":
                    name = f"{uvc_name}.f"

                # Write rendered content to output file
                out_file = out_subdir / name
                out_file.write_text(content, encoding="utf-8")
                logger.info(f"Written {out_file}")
