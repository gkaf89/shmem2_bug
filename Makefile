CC ?= mpicc
CFLAGS ?= -Wall -Wextra -O2
BIN = hello_mpi

all: $(BIN)

$(BIN): hello_mpi.c
	$(CC) $(CFLAGS) -o $@ $<

run: $(BIN)
	mpirun -np 4 ./$(BIN)

clean:
	rm -f $(BIN)

.PHONY: all run clean
