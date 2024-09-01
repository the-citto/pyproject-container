# pyproject-container

setup for python Flask development with Podman (same as Docker)
#
run `make` for a list most relevant recipes (waiting for the `--print-targets` option to work?)
#
create a python virtual environment with the same python version as for the container

the `.venv` is created only for the LSPs to work, the project's folder is mounted in the container
#
rename folder `python/pyproject_container/` to `python/<new-project-name>`
#
amend `pyproject.toml`
#
amend `README.md` and `LICENSE`
#

## TODOs

in `Makefile`, move management of `requirements*.txt` files to host (now on container)

test and production images, possibly with `docker-compose`



