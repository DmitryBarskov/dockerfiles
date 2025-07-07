rails:
	echo "Building rails with PRIMARY_GROUP_ID=$$(id -g) and CURRENT_USER_ID=$$(id -u)"
	docker build \
		-t rails \
		-f rails.Dockerfile \
		--build-arg PRIMARY_GROUP_ID="$$(id -g)" \
		--build-arg CURRENT_USER_ID="$$(id -u)" \
		.

alpine:
	docker build \
		-t alpine-user \
		-f alpine-with-current-user.Dockerfile \
		--build-arg GID="$$(id -g)" \
		--build-arg UID="$$(id -u)" \
		.

aws:
	docker build \
		-t aws \
		-f aws.Dockerfile \
		--build-arg GROUP_ID="$$(id -g)" \
		--build-arg USER_ID="$$(id -u)" \
		.

debian:
	docker build \
		-t debian-user \
		-f debian-with-current-user.Dockerfile \
		--build-arg GID="$$(id -g)" \
		--build-arg UID="$$(id -u)" \
		.

exercism:
	docker build -t exercism -f exercism.Dockerfile .

heroku:
	docker build \
		-t heroku \
		-f heroku.Dockerfile \
		--build-arg GID="$$(id -g)" \
		--build-arg UID="$$(id -u)" \
		--build-arg USERNAME="$$(whoami)" \
		~
