IMAGE     ?= ngn/proxy
NAME      ?= ngn-proxy

all: image run logs

image:
	docker build -t $(IMAGE) .

run:
	-docker rm -f $(NAME)
	docker run --name $(NAME) --net none --hostname ngn.cs.colorado.edu --dns 8.8.8.8 -d $(IMAGE)
	sleep 1
	sudo pipework br-pub202 -i eth0 -l ngn202 $(NAME) 128.138.202.207/24@128.138.202.1

logs:
	-docker logs --tail=all -f $(NAME)

.PHONY: image run logs all
