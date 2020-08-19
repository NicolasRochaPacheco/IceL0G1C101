

VERILATOR = verilator

# Sets the CPP file that will do the simulation
CPATH = $(shell find src -name 'simulation.cpp')

# Gets all the .v files from rtl directory
VPATH := $(shell find rtl -name '*.v')

TOP_MODULE = "fibonacci_top"

simulate:
	@echo "Performing simulation"
	$(VERILATOR) --cc $(VPATH) --exe $(CPATH) --top-module $(TOP_MODULE)
	make -j -C obj_dir -f Vfibonacci_top.mk

synthetize:
	@echo "Suppose it has uploaded to the FPGA"

clean:
	@echo "Deleting output folder"
	rm -r obj_dir
