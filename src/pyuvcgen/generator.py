from pathlib import Path
import shutil
import yaml
import jinja2
import logging

logger = logging.getLogger(__name__)

def generate_uvc(
    config_path: Path,
    templates_dir: Path,
    output_dir: Path
) -> None:
    """
    Generate UVM UVC code from a YAML config and Jinja2 templates.
    """
    
    data = yaml.safe_load(config_path.read_text(encoding="utf-8"))
    uvc_name = data["name"]
    
    dest_root = output_dir / uvc_name
    if dest_root.exists():
        shutil.rmtree(dest_root)
    dest_root.mkdir(parents=True)
    
    logging.info(f"Generating UVC: {uvc_name}")
    logging.info(f"Config Path:    {config_path}")
    logging.info(f"Templates Dir:  {templates_dir}")
    logging.info(f"Output Dir:     {output_dir}")
    
    env = jinja2.Environment(
        loader=jinja2.FileSystemLoader(str(templates_dir))
    )
    
    for tmpl in templates_dir.rglob("**/*"):
        if tmpl.is_file():
            rel = tmpl.relative_to(templates_dir)
            template_name = rel.as_posix()
            content = env.get_template(template_name).render(**data)

            out_subdir = dest_root / rel.parent
            out_subdir.mkdir(parents=True, exist_ok=True)
            
            name = rel.name
            if rel.parent.as_posix() in {"sv", "sv/seqlib"}:
                name = f"{uvc_name}_{name}"
            elif rel.name == "uvc.f":
                name = f"{uvc_name}.f"

            out_file = out_subdir / name
            out_file.write_text(content, encoding="utf-8")
            logger.info(f"Written {out_file}")