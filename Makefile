CFLAGS = -DCEU_DEBUG #-DCEU_DEBUG_TRAILS
CEUFILE = src/main.ceu
all:
	ceu --cpp-args "-I ." $(CEUFILE) --out-c ceu-sdl/C/_ceu_app.c --out-h ceu-sdl/C/_ceu_app.h 
	gcc -g -Os ceu-sdl/C/main.c $(CFLAGS) -lpthread -lm \
		-lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_net -lSDL2_gfx \
		-o main.exe

clean:
	find . -name "*.exe"  | xargs rm -f
	find . -name "_ceu_*" | xargs rm -f

.PHONY: all clean
