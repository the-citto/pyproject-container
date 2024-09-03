# pyproject-container

setup for python Flask development with Podman (same as Docker)

same approach should be straightforward for replacing `Flask` with [`Quart`](https://quart.palletsprojects.com/en/latest/) or `FastAPI`

#
run `make` for a list most relevant recipes (waiting for the `--print-targets` option to work?)
#
create a python virtual environment with the same python version as for the container

the `.venv` is created only for the LSPs to work, the project's folder is mounted in the container

**required:** `pyenv` to set up the `.venv` with the same python version as in the container

the same approach will be with `nvm` for `node` versions, `rustup` for `rust`, etc. (well, there's no virtual enviroments with those, but...)

_Note for future me: when time comes, explore feasibility of setting up ad-hoc container just for dependencies, likely with ad-hoc_ `.config/nvim`
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



