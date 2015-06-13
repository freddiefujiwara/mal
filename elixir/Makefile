
TESTS = test/step0_repl_test.exs

SOURCES_BASE = lib/step0_repl.ex
SOURCES_LISP = step0_repl.exs
SOURCES = $(SOURCES_BASE) $(SOURCES_LISP)

.PHONY: stats tests $(TESTS)

stats: $(SOURCES)
	@wc $^
stats-lisp: $(SOURCES_LISP)
	@wc $^

tests: $(TESTS)

$(TESTS):
	@echo "Running $@"; \
	mix test $@ || exit 1; \
