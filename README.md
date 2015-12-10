# Dockerfiles for images

[![Circle CI](https://circleci.com/gh/larvs/dockerfiles.svg?style=svg)](https://circleci.com/gh/larvs/dockerfiles)

This is a repository to hold various Dockerfiles for images.

## Local build, run

```sh
cd folder_name
docker build -t folder_name .
docker run folder_name
```

## Dockerfile

- [fortunes-cowsay](fortunes-cowsay): ubuntu, fortune, cowsay

	```sh
	docker run larv/fortunes-cowsay
	```
