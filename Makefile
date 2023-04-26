# LOAD ENVIRONMENTAL VARIABLES FROM .ENV FILES
include .env
export $(shell sed "s/=.*//" .env)

npm_i = docker-compose -f ./docker-compose.yml --env-file ./.env  up
npm_run_build = docker-compose -f ./docker-compose.yml --env-file ./.env  up
npm_run_dev = docker-compose -f ./docker-compose.yml --env-file ./.env  up
npm_i = docker-compose -f ./docker-compose.yml --env-file ./.env  up
yarn_i = docker-compose up --build -d --remove-orphans
compose_kill = docker-compose kill
compose_logs = docker-compose logs

dc_deploy:
	$(compose_kill)
	$(compose_build)
	$(compose_up) || true
dc_up:
	$(compose_up) || true
dc_logs:
	$(compose_logs)
dc_build:
	$(compose_build)