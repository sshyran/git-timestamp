PREFIX	= /usr/local
BINDIR	= ${PREFIX}/bin

all:
	echo "Use make install, apt, or test"

install:
	${INSTALL} --backup --compare igitt_client/timestamp.py ${BINDIR}/git-timestamp

apt dependencies:
	apt install python3-gnupg python3-pygit2 python3-requests

test tests:	system-tests

system-tests:
	@d=`mktemp -d`; for i in tests/*; do echo; echo ===== $$i $$d; $$i $$d || exit 1; done; echo ===== Cleanup; ${RM} -r $$d

# Build targets
pypi-build:
	${RM} -f dist/*
	./setup.py sdist bdist_wheel

pypi:	pypi-build
	twine upload dist/*

ppa:	pypi-build
	py2dsc dist/*.tar.gz
