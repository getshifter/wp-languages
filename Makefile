.PHONY: build

build:
	docker build -t local/wp-languages . --no-cache
