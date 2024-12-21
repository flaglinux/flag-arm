IMAGE    ?= flab/flag-arm
VERSION  ?= 1.0

all: build push

build:
	docker build --progress=plain -t $(IMAGE):$(VERSION) .

push:
	docker --debug push $(IMAGE):$(VERSION)

run:
	docker run -it --rm --name lind \
		-v /Volumes/FlagWorkspace:/home/ubuntu/workspace \
		$(IMAGE):$(VERSION) \
		bash

#docker run -it --rm --name lind2 -v /Volumes/FlagWorkspace:/home/ubuntu/workspace flab/flag-arm:1.0 bash
