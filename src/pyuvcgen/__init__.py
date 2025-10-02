from importlib.metadata import version, PackageNotFoundError

try:
    __version__ = version("pyuvcgen")
except PackageNotFoundError:
    __version__ = "0.0.0"

from .generator import generate_uvc

__all__ = [
    "__version__",
    "generate_uvc",
]
