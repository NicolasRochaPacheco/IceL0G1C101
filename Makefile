




simulate:
	@echo "Performing simulation"
	$(VERILATOR) --cc $(VPATH) --exe $(CPATH)
	make -j -C obj_dir -f V

synthetize:
