SHELL := /bin/bash

test:
	test -f .venv/bin/activate && source .venv/bin/activate && python setup.py test
release: install-twine clean
	test -f .venv/bin/activate && source .venv/bin/activate &&  python setup.py sdist bdist_wheel && python -m twine upload dist/*
	$(MAKE) clean
install-twine:
	test -f .venv/bin/activate && source .venv/bin/activate && pip install --quiet twine
clean:
	rm -rf dist build .eggs
