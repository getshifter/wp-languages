.PHONY: build

build:
	docker build --platform=linux/amd64 -t local/wp-languages . --no-cache
