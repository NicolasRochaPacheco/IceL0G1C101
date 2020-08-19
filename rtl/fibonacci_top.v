


module fibonacci_top (
  clock_in,
  reset_in,
  led_out
)

// Wire definition
wire x1_set_wire;
wire x2_set_wire;
wire x3_set_wire;
wire x4_set_wire;
wire x5_set_wire;
wire [3:0] x1_data_wire;
wire [3:0] x2_data_wire;
wire [3:0] x3_data_wire;
wire [3:0] x4_data_wire;
wire [3:0] x5_data_wire;

wire mux_sel_wire;
wire [3:0] mux_data_wire;

wire [3:0] adder_data_wire;
wire [3:0] dec_data_wire;

wire zero_wire;

wire t0_int_wire;
wire t1_int_wire;
wire t2_int_wire;
wire t0_start_wire;
wire t1_start_wire;
wire t2_start_wire;


control control0 (
  .clock_in(clock_in),
  .reset_in(reset_in),
  .zero_flag_in(zero_wire)
  .t0_int_in(t0_int_wire),
	.t1_int_in(t1_int_wire),
	.t2_int_in(t2_int_wire),
	.mux_sel_out(mux_sel_wire),
	.x1_set_out(x1_set_wire),
	.x2_set_out(x2_set_wire),
	.x3_set_out(x3_set_wire),
	.x4_set_out(x4_set_wire),
	.t0_start_out(t0_int_wire),
	.t1_start_out(t1_int_wire),
	.t2_start_out(t2_int_wire),
	.led_out(led_out)
);

gen_reg #(.DATA_WIDTH(4)) x1 (
  .clock_in(clock_in),
  .reset_in(reset_in),
  .set_in(x1_set_wire),
  .data_in(x2_data_wire)
  .data_out(x1_data_wire)
);

gen_reg #(.DATA_WIDTH(4), .RESET_VALUE(0)) x2 (
  .clock_in(clock_in),
  .reset_in(reset_in),
  .set_in(x2_set_wire),
  .data_in(x3_data_wire)
  .data_out(x2_data_wire)
);

gen_reg #(.DATA_WIDTH(4)) x3 (
  .clock_in(clock_in),
  .reset_in(reset_in),
  .set_in(x3_set_wire),
  .data_in(adder_data_wire)
  .data_out(x3_data_wire)
);

gen_reg #(.DATA_WIDTH(4)) x4 (
  .clock_in(clock_in),
  .reset_in(reset_in),
  .set_in(x4_set_wire),
  .data_in(mux_data_wire)
  .data_out(x4_data_wire)
);

gen_reg #(.DATA_WIDTH(4), .RESET_VALUE(5)) x5 (
  .clock_in(clock_in),
  .reset_in(reset_in),
  .set_in(x5_set_wire),
  .data_in()
  .data_out(x5_data_wire)
);

adder #(.DATA_WIDTH(4)) adder0 (
  .data_a_in(x1_data_wire),
  .data_b_in(x3_data_wire),
  .data_out(adder_data_wire)
);

dec #(.DATA_WIDTH(4)) dec0 (
  .data_in(x4_data_wire),
  .data_out(dec_data_wire)
);

mux #(.DATA_WIDTH(4)) mux0 (
  .sel_in(mux_sel_wire),
  .data_a_in(adder_data_wire),
  .data_b_in(dec_data_wire),
  .data_out(mux_data_wire)
);

zero #(.DATA_WIDTH(4)) zero0 (
  .data_in(x4_data_wire),
  .zero_out(zero_wire)
);

timer #(.DATA_WIDTH(11), .STOP_VALUE(1600)) t0 (
  .clock_in(clock_in),
  .reset_in(reset_in),
  .start_in(),
  .int_out()
);

timer #(.DATA_WIDTH(11), .STOP_VALUE(1599)) t0 (
  .clock_in(clock_in),
  .reset_in(reset_in),
  .start_in(),
  .int_out()
);

timer #(.DATA_WIDTH(13), .STOP_VALUE(8000)) t0 (
  .clock_in(clock_in),
  .reset_in(reset_in),
  .start_in(),
  .int_out()
);

endmodule
