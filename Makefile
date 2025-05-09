#makefie
# Abre um bash dentro do container
bash:
	docker-compose run --rm laravel bash

# Cria um novo projeto Laravel
new:
	docker-compose run --rm laravel composer create-project --prefer-dist laravel/laravel $(PROJECT_NAME)

# Altera o nome do projeto no Makefile e roda "make new"
init:
	@read -p "Nome do projeto: " NAME; \
	sed -i "s/^PROJECT_NAME=.*/PROJECT_NAME=$$NAME/" Makefile; \
	make new
