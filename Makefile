MPICC ?= mpicc

ifeq ($(shell command -v $(MPICC) >/dev/null 2>&1; echo $$?),1)
$(error MPI compiler '$(MPICC)' not found on PATH. Load your MPI module, or set MPICC=/path/to/mpicc)
endif
CFLAGS ?= -Wall -Wextra -O2
BIN = hello_mpi

all: $(BIN)

$(BIN): hello_mpi.c
	$(MPICC) $(CFLAGS) -o $@ $<

run: $(BIN)
	mpirun -np 4 ./$(BIN)

clean:
	rm -f $(BIN)

.PHONY: all run clean
