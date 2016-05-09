#
# Binaries.
#

ESLINT = node_modules/.bin/eslint
JSFMT = node_modules/.bin/jsfmt
MOCHA = node_modules/.bin/mocha
ZUUL = node_modules/.bin/zuul

#
# Files.
#

SRCS = index.js
TESTS = test/index.js

#
# Options.
#

GREP ?=.

#
# Tasks.
#

# Install node packages.
node_modules: $(wildcard package.json node_modules/*/package.json)
	@npm install

# Remove temporary files.
clean:
	rm -rf *.log
.PHONY: clean

# Remove temporary and packaged files.
distclean: clean
	rm -rf node_modules
.PHONY: distclean

# Format files.
fmt: node_modules
	@$(JSFMT) --write $(SRCS) $(TESTS)
.PHONY: fmt

# Lint files.
lint: node_modules
	@$(ESLINT) $(SRCS) $(TESTS)
.PHONY: lint

# Run perf tests.
perf: node_modules
	@node perf/index.js
.PHONY: perf

# Run tests in node.
test: node_modules
	@$(MOCHA) \
		--ui bdd \
		--reporter spec \
		--grep "$(GREP)" \
		$(TESTS)
.PHONY: test
.DEFAULT_GOAL = test

# Run tests in a Sauce Labs browser.
test-browser: node_modules
	@$(ZUUL) -- $(TESTS)
.PHONY: test-browser

# Run tests in a local browser.
test-browser-local: node_modules
	@$(ZUUL) --local -- $(TESTS)
.PHONY: test-browser-local
