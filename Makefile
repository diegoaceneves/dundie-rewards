.PHONY: install virtualenv ipython clean test testci watch lint


install:
	@echo "Installing Requirements"
	@.venv/bin/python -m pip install -e .


virtualenv:
	@python3 -m venv .venv


ipython:
	@.venv/bin/ipython


test:
	@.venv/bin/pytest -s


lint:
	@.venv/bin/pflake8


fmt:
	@.venv/bin/isort dundie tests integration
	@.venv/bin/black dundie tests integration


testci:
	@.venv/bin/pytest -v --junitxml=test-result.xml


watch:
	# @.venv/bin/ptw
	@ls **/*.py | entr pytest --forked

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

build:
	@.venv/bin/python setup.py sdist bdist_wheel
