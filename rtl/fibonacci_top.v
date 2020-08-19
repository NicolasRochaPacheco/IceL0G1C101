


module fibonacci_top (
  clock_in,
  reset_in,
  led_out
)

// Wire definition
wire x1_set_wire;


control c0 (
  .clock_in(clock_in),
  .reset_in(reset_in),
  .zero_flag_in()
  .t0_int_in,
	.t1_int_in,
	.t2_int_in,
	.mux_sel_out,
	.x1_set_out(x1_set_wire),
	.x2_set_out,
	.x3_set_out,
	.x4_set_out,
	.t0_start_out,
	.t1_start_out,
	.t2_start_out,
	.led_out
);

gen_reg #(.DATA_WIDTH(4)) x1 (
  .clock_in(clock_in),
  .reset_in(reset_in),
  .set_in(x1_set_wire),
  .data_in()
  .data_out()
);

gen_reg #(.DATA_WIDTH(4), .RESET_VALUE(0)) x2 (
  .clock_in(clock_in),
  .reset_in(reset_in),
  .set_in(x1_set_wire),
  .data_in()
  .data_out()
);

gen_reg #(.DATA_WIDTH(4)) x3 (
  .clock_in(clock_in),
  .reset_in(reset_in),
  .set_in(x1_set_wire),
  .data_in()
  .data_out()
);

gen_reg #(.DATA_WIDTH(4)) x4 (
  .clock_in(clock_in),
  .reset_in(reset_in),
  .set_in(x1_set_wire),
  .data_in()
  .data_out()
);

gen_reg #(.DATA_WIDTH(4), .RESET_VALUE(5)) x5 (
  .clock_in(clock_in),
  .reset_in(reset_in),
  .set_in(x1_set_wire),
  .data_in()
  .data_out()
);



endmodule
