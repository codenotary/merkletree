export GO111MODULE=on

SHELL=/bin/bash -o pipefail
GO ?= go

.PHONY: test
test:
	$(GO) vet ./...
	GOTRACEBACK=all $(GO) test --race ${TEST_FLAGS} ./...