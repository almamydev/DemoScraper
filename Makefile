build:
	docker build . -t ds 

up: 
	docker run --env-file ./.env.prod -p 8003:8003 -d --name ds ds

reload: build up

go: reload