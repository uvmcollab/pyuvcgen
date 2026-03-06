# pyuvcgen

`pyuvcgen` is a lightweight Python-based code generator that leverages the
[`jinja2`](https://jinja.palletsprojects.com/en/3.1.x/) templating engine
and the [`pyyaml`](https://pyyaml.org/) YAML parser packages to produce
UVM (Universal Verification Methodology) UVCs (UVM Verification
Components) templates.

## Features

- Generates ready-to-use UVM UVC code from customizable templates.
- Configurable via a simple YAML file (`uvc.yaml`)
- Following industry best practices:
  - [The Easier UVM Coding Guidelines (Doulos)](https://www.doulos.com/media/1277/easier-uvm-coding-guidelines-2016-06-24.pdf)
  - [UVM Guidelines (SIEMENS Verification Academy)](https://verificationacademy.com/cookbook/uvm-universal-verification-methodology/uvm-guidelines/)
- Isolated environment for testing UVCs, with the option to integrate the generated UVC as a Git submodule in larger projects.
- Can also be used to scaffold test environments for small RTL designs.

## Prerequisites

- Python 3.12 or later.
- [uv](https://docs.astral.sh/uv/) Python package and project manager

## Usage

1. Clone the repository

3. Navigate to the `tests/` directory:

   ```bash
   cd tests/
   ```

4. Edit the configuration file `yaml/uvc.yaml` to suit your UVC requirements.

5. Generate the UVC code:

   ```bash
   uv run pyuvcgen -i yaml/uvc.yaml
   ```

6. After running the command, a `generated_uvc/` directory will appear in `tests/`, containing your UVC code.

## Contributing

Contributions, issues, and feature requests are welcome! Feel free to check issues or submit a pull request.
