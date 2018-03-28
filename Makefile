# Build the Jupyter notebook
build-jupyter:
	cd jupyter && docker build --tag opendatacube/jupyter:local .

run-jupyter:
	cd jupyter && docker-compose up
