FROM ubuntu:latest

# Install Python 3.11 and Node.js 18
RUN apt update
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt update
RUN apt install -y sudo \
	python3.11 python3.11-dev python3.11-venv nodejs npm
RUN npm install -g typescript 