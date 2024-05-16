all:
	docker-compose -f ./srcs/docker-compose.yml up --build -d
clean:
	docker-compose -f ./srcs/docker-compose.yml down
fclean: clean
	docker system prune --all --force
	docker volume rm srcs_Files srcs_Database 2>/dev/null || true