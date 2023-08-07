CC := gcc
CFLAGS := -O3 -Wall -Wextra -Wno-unused-parameter -pedantic -std=c99
CPPFLAGS += -D_POSIX_C_SOURCE=200809L

CFLAGS += -Wno-pointer-sign
CFLAGS += -Wno-maybe-uninitialized
CFLAGS += -Wno-unused-but-set-variable
CFLAGS += -Wno-sign-compare
# Danger: undefined behavior!
# CFLAGS += -Wno-sequence-point

SRC := $(wildcard *.c)
BIN := blz huffman lze lzss lzx rle
OBJ := $(SRC:.c=.o)

all: $(BIN)

$(BIN): platform.o

clean:
	$(RM) $(OBJ) $(BIN)

# Generated with gcc $(CPPFLAGS) -MM -MG -MT '$(<:.c=.o)' $<
blz.o: blz.c platform.h
huffman.o: huffman.c platform.h
lze.o: lze.c platform.h
lzss.o: lzss.c platform.h
lzx.o: lzx.c platform.h
platform.o: platform.c platform.h
rle.o: rle.c platform.h
