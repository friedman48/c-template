# Makefile for compiling C source files

# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -Werror -O2 -fstack-protector -D_FORTIFY_SOURCE=2

# Source and target
SRC = linux.c
OBJ = $(SRC:.c=.o)
TARGET = helloworld

# Default target
all: $(TARGET)

# Rule to compile C source files into object files
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

# Rule to link object files into the final executable
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJ)

# Clean up generated files
clean:
	rm -f $(OBJ) $(TARGET)

# Phony targets
.PHONY: all clean
