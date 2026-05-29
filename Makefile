.PHONY: docker run

docker:
	docker build \
		--pull \
		--tag autonomouslogic/base-image:dev \
		-f Dockerfile \
		.

run: docker
	docker run --rm -it --entrypoint bash autonomouslogic/base-image:dev
