# pyproject-container

setup for python Flask development with Podman (same as Docker)

same approach should be straightforward for replacing `Flask` with [`Quart`](https://quart.palletsprojects.com/en/latest/) or `FastAPI`

#
run `make` for a list of some relevant recipes (consider using `--print-targets`, but likely it works for non-dummy targets)
#
create locally a python virtual environment with the same python version as for the container

the `.venv` is created only for the LSPs to work, the project's folder is mounted in the container

**required:** `pyenv` to set up the `.venv` with the same python version as in the container

changes to the `requirements.txt` files can be done lo9cally, but the `Makefile` has recipies to do it from the container - keep the local `.venv` updated 
#
similar approach will be with `nvm` for `node` versions, `rustup` for `rust`, etc. (well, there's no virtual enviroments with those, but...)

_Note for future me: when time comes, explore feasibility of setting up ad-hoc container just for dependencies, likely with ad-hoc_ `.config/nvim`
#
rename folder `python/pyproject_container/` to `python/<new-project-name>`
#
amend `pyproject.toml`
#
amend `README.md` and `LICENSE`
#

## TODOs

test and production images, possibly with `docker-compose`



