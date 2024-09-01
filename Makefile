
.PHONY: is-container
.PHONY: all-requirements
.PHONY: req
.PHONY: req-dev
.PHONY: req-tests

.PHONY: is-host
.PHONY: build-dev
.PHONY: run-dev
.PHONY: prune
.PHONY: prune-all


all:
	@echo ""
	@echo recipies:
	@echo ""
	@echo local dev:
	@echo ""
	@echo local-req-dev
	@echo guni-dev
	@echo ""
	@echo piptools:
	@echo req
	@echo req-dev
	@echo req-tests
	@echo ""
	@echo podman/docker:
	@echo build-dev
	@echo run-dev
	@echo prune
	@echo prune-all
	@echo ""


BASENAME = $(shell basename $(CURDIR))
CONTAINER-HOSTNAME = python-dev

export HOSTNAME




is-host:
ifeq ($(HOSTNAME),$(CONTAINER-HOSTNAME))
	$(error podman/docker commands are meant to be run in the host)
endif


is-container:
ifneq ($(HOSTNAME),$(CONTAINER-HOSTNAME))
	$(error pip and piptools commands are meant to be run within the container)
endif



local-req-dev: is-host
	.venv/bin/python -m pip install --upgrade pip pip-tools
	.venv/bin/python -m piptools sync requirements-dev.txt
	.venv/bin/python -m pip install --root-user-action=ignore -e .[dev] ;\


guni-dev: is-host
	podman exec -it $(BASENAME) gunicorn -w 2 --threads 2 $(BASENAME):app --reload


run-dev: is-host
	podman run \
		-ti \
		--replace \
		--name $(BASENAME) \
		--hostname $(CONTAINER-HOSTNAME) \
		-v $(CURDIR):/$(BASENAME) \
		--workdir=/$(BASENAME) \
		-p 8000:8000 \
		$(BASENAME) \
		sh -i -c "\
			pip install --root-user-action=ignore --upgrade pip pip-tools ;\
			piptools sync requirements-dev.txt ;\
			pip install --root-user-action=ignore -e .[dev] ;\
			bash"

build-dev: is-host
	podman build --tag $(BASENAME) .

prune: is-host
	podman system prune

prune-all: is-host
	podman system prune -a



requirements.txt: pyproject.toml
	python -m piptools compile -o requirements.txt pyproject.toml

req: all-requirements
	python -m piptools sync requirements.txt


requirements-dev.txt: pyproject.toml
	python -m piptools compile --extra dev -o requirements-dev.txt pyproject.toml

req-dev: all-requirements
	python -m piptools sync requirements-dev.txt
	python -m pip install --root-user-action=ignore -e .[dev]


requirements-tests.txt: pyproject.toml
	python -m piptools compile --extra tests -o requirements-tests.txt pyproject.toml

req-tests: all-requirements
	python -m piptools sync requirements-tests.txt


update: is-container
	python -m pip install --root-user-action=ignore --upgrade pip pip-tools


all-requirements: update requirements.txt requirements-tests.txt requirements-dev.txt 



