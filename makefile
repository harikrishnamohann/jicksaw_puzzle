CC = gcc
CFLAGS = -lncurses -ldl -lpthread -lm
DEBUG = uni-void

all: obj target game_files target/$(DEBUG)

# Run target
run: obj target game_files target/$(DEBUG)
	./target/$(DEBUG)

target/$(DEBUG): obj/main.o obj/lb.o obj/arena.o obj/keymaps.o obj/save_and_load.o obj/utils.o
	$(CC) $^ -o $@ $(CFLAGS)


# Object files
obj/main.o: src/main.c
	$(CC) -c $< -o $@

obj/lb.o: src/leaderboard.c
	$(CC) -c $< -o $@

obj/keymaps.o: src/keymaps.c
	$(CC) -c $< -o $@

obj/save_and_load.o: src/save_and_load.c
	$(CC) -c $< -o $@

obj/utils.o: src/utils.c
	$(CC) -c $< -o $@

obj/arena.o: lib/arena.c
	$(CC) -c $< -o $@

# Ensure directories exist
obj:
	@echo "Creating directory ./obj"
	mkdir -p ./obj

target:
	@echo "Creating directory ./target"
	mkdir -p ./target

game_files:
	@echo "creating directory ./game_files"
	mkdir -p ./game_files

# Clean target
clean:
	rm -rf obj target/$(DEBUG)
