FRONT_END_BINARY=frontApp

build_front:
	@echo "Building front end binary..."
	env CGO_ENABLED=0 go build -o ${FRONT_END_BINARY} ./cmd/web
	@echo "Done!"

start: build_front
	@echo "Starting front end"
	./${FRONT_END_BINARY} &

stop:
	@echo "Stopping front end..."
	@-pkill -SIGTERM -f "./${FRONT_END_BINARY}"
	@echo "Stopped front end!"