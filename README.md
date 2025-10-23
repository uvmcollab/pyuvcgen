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

- Python 3.9.21 or later.

## Development

Note: this is still under development!

1. Clone de repository and navigate to its root directory:

    ```bash
    git clone https://github.com/cirofabianbermudez/pyuvcgen.git
    cd pyuvcgen
    ```

2. Create a Python virtual environment and install dependencies:

    ```bash
    ./scripts/setup/setup_python_env.sh
    source .venv/bin/activate
    ```

3. Verify installation:

    ```bash
    pyuvcgen -h
    ```

## Usage

1. Activate your Python virtual environment (if not already active):

   ```bash
   source .venv/bin/activate
   ```

2. Navigate to the `tests/` directory:

   ```bash
   cd tests/
   ```

3. Edit the configuration file `yaml/uvc.yaml` to suit your UVC requirements.

4. Generate the UVC code:

   ```bash
   pyuvcgen -c yaml/uvc.yaml
   ```

5. After running the command, a `generated_uvc/` directory will appear in `tests/`, containing your UVC code.

## Contributing

Contributions, issues, and feature requests are welcome! Feel free to check issues or submit a pull request.
