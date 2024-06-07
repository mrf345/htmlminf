SHELL := /bin/bash

test:
	test -f .venv/bin/activate && source .venv/bin/activate && python setup.py test
release: install-dev clean
	test -f .venv/bin/activate && source .venv/bin/activate &&  python setup.py sdist bdist_wheel && python -m twine upload dist/*
	$(MAKE) clean
clean:
	rm -rf dist build .eggs
