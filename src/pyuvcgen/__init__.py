from importlib.metadata import version, PackageNotFoundError

from .generator import generate_uvc

try:
    __version__ = version("pyuvcgen")
except PackageNotFoundError:
    __version__ = "0.0.0"

__all__ = [
    "__version__",
    "generate_uvc",
]
