"""Init."""

import importlib.metadata

from .app import app



__version__ = importlib.metadata.version(__name__)

__all__ = ["app"]




