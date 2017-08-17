.PHONY: install
install:
	go get github.com/mattn/goveralls
	go get github.com/alecthomas/gometalinter
	gometalinter --install

.PHONY: test
test:
	go test ./...
	$(GOPATH)/bin/gometalinter ./... --fast

.PHONY: test-ci
test-ci:
	-$(GOPATH)/bin/goveralls -v -service=travis-ci
	-$(GOPATH)/bin/gometalinter ./...