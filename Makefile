.PHONY: install virtualenv ipython clean test


install:
	@echo "Installing for dev environment"
	@.venv/bin/python -m pip install -e '.[dev]'


virtualenv:
	@.venv/bin/python -m venv .venv


ipython:
	@.venv/bin/ipython


test:
	@.venv/bin/pytest -s


testci:
	@.venv/bin/pytest -v --junitxml=test-result.xml


watch:
	# @.venv/bin/ptw -- -vv -s
	@ls **/*.py | xargs pytest

clean:            ## Clean unused files.
	@find ./ -name '*.pyc' -exec rm -f {} \;
	@find ./ -name '__pycache__' -exec rm -rf {} \;
	@find ./ -name 'Thumbs.db' -exec rm -f {} \;
	@find ./ -name '*~' -exec rm -f {} \;
	@rm -rf .cache
	@rm -rf .pytest_cache
	@rm -rf .mypy_cache
	@rm -rf build
	@rm -rf dist
	@rm -rf *.egg-info
	@rm -rf htmlcov
	@rm -rf .tox/
	@rm -rf docs/_build
