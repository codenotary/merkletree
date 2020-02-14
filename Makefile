export GO111MODULE=on

SHELL=/bin/bash -o pipefail
GO ?= go

.PHONY: test
test:
	@$(GO) vet ./...
	@GOTRACEBACK=all $(GO) test --race ${TEST_FLAGS} ./...

.PHONY: CHANGELOG.md
CHANGELOG.md:
	@([ -z "${VERSION}" ] && echo "Please set VERSION=x.y.z of next version" && exit 1) || true
	@git-chglog -o CHANGELOG.md --next-tag v${VERSION}