"""Flask app."""

import flask

from . import vars



app = flask.Flask(__name__)


@app.route("/")
def root() -> str:
    """Root."""
    return vars.WELCOME_TEXT


if __name__ == "__main__":
    app.run()

