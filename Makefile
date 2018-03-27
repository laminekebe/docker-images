# Build the Jupyter notebook
build-jupyter:
	cd jupyter && docker build --tag opendatacube/jupyter:local .

run-jupyter:
	docker run \
		--rm \
		-p 8888:8888 \
		opendatacube/jupyter:local
