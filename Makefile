APP_BACKEND_DIR = /home/app/backend
APP_FRONTEND_DIR = /home/app/frontend

start:
	docker-compose -f docker-compose/docker-compose.yml up --build -d

stop:
	docker-compose -f docker-compose/docker-compose.yml down

app:
	docker-compose -f docker-compose/docker-compose.yml exec app bash -c "cd /home/app && bash"

nginx:
	docker-compose -f docker-compose/docker-compose.yml exec nginx bash

php:
	docker-compose -f docker-compose/docker-compose.yml exec php bash -c "cd $(APP_BACKEND_DIR) && bash"

hot:
	docker exec -td mb-app bash -ic "cd $(APP_FRONTEND_DIR) && yarn dev"

hotf:
	docker-compose -f docker-compose/docker-compose.yml exec app bash -ci "cd $(APP_FRONTEND_DIR) && yarn dev"

echo:
	docker-compose -f docker-compose/docker-compose.yml exec laravel-echo-server bash

update:
	docker-compose -f docker-compose/docker-compose.yml build --no-cache
