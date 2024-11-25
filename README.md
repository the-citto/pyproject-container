# pyproject-container

A first manual setup for python `Flask` (or [`Quart`](https://quart.palletsprojects.com/en/latest/) or `FastAPI`) development with `Podman` / `Docker` with a workflow approach similar to [DevContainers](https://github.com/devcontainers/spec)

The rationale is to use the local development environment for writing code instead of creating the development image as below

![image](https://github.com/user-attachments/assets/8fa8c42c-a0d2-434f-9a99-7407defb46d2)

During development the Flask `werkzeug` server is running on the container - `werkzeug` restarts as usual when source files are changed locally

## setup / usage
run `make` for a list of some relevant recipes (TODO: consider using `--print-targets`)
#
create locally a python virtual environment with the same python version as for the container

the `.venv` is created only for the LSPs to work, the project's folder is mounted in the container

**required:** `pyenv` to set up the `.venv` with _the same_ python version as in the container

changes to the `requirements.txt` files can be done locally, but the `Makefile` has recipies to do it from the container - keep the local `.venv` updated 
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

 - update dependency management with `requirements.in` files vs using `project.dependencies` and `project.optional-dependencies` in `pyproject.toml` (as in [pyproject-base](https://github.com/the-citto/pyproject-base))

 - test and production images, likely with `docker-compose`



