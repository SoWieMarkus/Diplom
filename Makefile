#!make

DIR:=C:/Users/Markus/Repos/Uni/Diplom
USER_ID:=501
USER_NAME:=sowiemarkus
USER_HOME:=/home/latex
BASE_IMAGE:=kaestner/latex
DOCKER_IMAGE:=wieland/latex

.PHONY: all

thesis:
	@docker build --output ./ .

shell:
	@docker run -it --rm -v $(DIR):$(USER_HOME) $(DOCKER_IMAGE) bash

clean:
	@docker run --rm -v $(DIR):$(USER_HOME) $(DOCKER_IMAGE) bash -c "latexmk -C"

count:
	@docker run --rm -v $(DIR):$(USER_HOME) $(DOCKER_IMAGE) bash -c "texcount -inc thesis.tex"

container:
	@docker build --build-arg USER_ID=$(USER_ID) --build-arg USER_NAME=$(USER_NAME) --build-arg USER_HOME=$(USER_HOME) --build-arg BASE_IMAGE=$(BASE_IMAGE) --target latex -t $(DOCKER_IMAGE) .