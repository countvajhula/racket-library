# Adapted from: http://www.greghendershott.com/2017/04/racket-makefiles.html
SHELL=/bin/bash

PACKAGE-NAME=<project>

DEPS-FLAGS=--check-pkg-deps --unused-pkg-deps

help:
	@echo "build - Compile package"
	@echo "build-docs - Build docs"
	@echo "build-standalone-docs - Build self-contained docs that could be hosted somewhere"
	@echo "check-deps - Check dependencies"
	@echo "build-all - Compile package, build docs, and check dependencies"
	@echo "clean - Remove all build artifacts"
	@echo "install - Install package along with dependencies"
	@echo "remove - Remove package"
	@echo "test - Run tests"
	@echo "test-with-errortrace - Run tests with error tracing"
	@echo "errortrace - Alias for test-with-errortrace"
	@echo "cover - Run test coverage checker and view report"
	@echo "cover-coveralls - Run test coverage and upload to Coveralls"
	@echo "coverage-check - Run test coverage checker"
	@echo "coverage-report - View test coverage report"
	@echo "docs - View docs in a browser"
	@echo "profile - Run performance benchmarks"

# Primarily for use by CI.
# Installs dependencies as well as linking this as a package.
install:
	raco pkg install --deps search-auto --link $(PWD)/$(PACKAGE-NAME)-{lib,test,doc} $(PWD)/$(PACKAGE-NAME)

remove:
	raco pkg remove $(PACKAGE-NAME)-{lib,test,doc} $(PACKAGE-NAME)

# Primarily for day-to-day dev.
# Build libraries from source.
build:
	raco setup --no-docs --tidy --pkgs $(PACKAGE-NAME)-lib

# Primarily for day-to-day dev.
# Build docs (if any).
build-docs:
	raco setup --no-launcher --no-foreign-libs --no-info-domain --no-pkg-deps \
	--no-install --no-post-install --tidy --pkgs $(PACKAGE-NAME)-doc

# Primarily for day-to-day dev.
# Build libraries from source, build docs (if any), and check dependencies.
build-all:
	raco setup --tidy $(DEPS-FLAGS) --pkgs $(PACKAGE-NAME)-{lib,test,doc} $(PACKAGE-NAME)

# Primarily for CI, for building backup docs that could be used in case
# the main docs at docs.racket-lang.org become unavailable.
build-standalone-docs:
	scribble +m --redirect-main http://pkg-build.racket-lang.org/doc/ --htmls --dest ./docs ./$(PACKAGE-NAME)-doc/scribblings/$(PACKAGE-NAME).scrbl

# Primarily for use by CI, after make install -- since that already
# does the equivalent of make build, this tries to do as little as
# possible except checking deps.
check-deps:
	raco setup --no-docs $(DEPS-FLAGS) $(PACKAGE-NAME)

# Note: Each collection's info.rkt can say what to clean, for example
# (define clean '("compiled" "doc" "doc/<collect>")) to clean
# generated docs, too.
clean:
	raco setup --fast-clean --pkgs $(PACKAGE-NAME)-{lib,test,doc}

# Suitable for both day-to-day dev and CI
test:
	raco test -exp $(PACKAGE-NAME)-{lib,test,doc}

build+test: build test

test-with-errortrace:
	racket -l errortrace -l racket -e '(require (submod "$(PACKAGE-NAME)-test/tests/$(PACKAGE-NAME).rkt" test))'

errortrace: test-with-errortrace

coverage-check:
	raco cover -b -d ./coverage -p $(PACKAGE-NAME)-{lib,test}

coverage-report:
	open coverage/index.html

cover: coverage-check coverage-report

cover-coveralls:
	raco cover -b -f coveralls -p $(PACKAGE-NAME)-{lib,test}

docs:
	raco docs $(PACKAGE-NAME)

profile:
	echo "Profiling $(PACKAGE-NAME)..."
	racket profile/$(PACKAGE-NAME).rkt

.PHONY:	help install remove build build-docs build-all check-deps clean test test-with-errortrace errortrace docs profile cover coverage-check coverage-report cover-coveralls
