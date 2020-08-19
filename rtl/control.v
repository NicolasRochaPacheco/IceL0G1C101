



module CONTROL (
	clock_in,
	reset_in,
	zero_flag_in,
	t0_int_in,
	t1_int_in,
	t2_int_in,
	mux_sel_out,
	x1_set_out,
	x2_set_out,
	x3_set_out,
	x4_set_out,
	t0_start_out,
	t1_start_out,
	t2_start_out,
	led_out
);

// Input and output definition
input clock_in;
input reset_in;
input zero_flag_in;
output reg mux_sel_out;
output reg x1_set_out;
output reg x2_set_out;
output reg x3_set_out;
output reg led_out;

// Registers definition
reg led_reg;
reg [2:0] state_reg;

// Combinational logic
always @ ( * )
begin // Assigns the output based on the current state
	case (state_reg)
		3'b000: begin // S0 state
							mux_sel_out = 1'b0;
							x1_set_out = 1'b0;
							x2_set_out = 1'b0;
							x3_set_out = 1'b1;
							x4_set_out = 1'b1;
							t0_start_out = 1'b0;
							t1_start_out = 1'b0;
							t2_start_out = 1'b0;
							led_out = 1'b0;
						end

		3'b001: begin // S1 state
							mux_sel_out = 1'b0;
							x1_set_out = 1'b1;
							x2_set_out = 1'b0;
							x3_set_out = 1'b0;
							x4_set_out = 1'b0;
							t0_start_out = 1'b0;
							t1_start_out = 1'b0;
							t2_start_out = 1'b0;
							led_out = 1'b0;
						end

		3'b010: begin // S2 state
							mux_sel_out = 1'b0;
							x1_set_out = 1'b0;
							x2_set_out = 1'b1;
							x3_set_out = 1'b0;
							x4_set_out = 1'b0;
							t0_start_out = 1'b0;
							t1_start_out = 1'b0;
							t2_start_out = 1'b0;
							led_out = 1'b0;
						end

		3'b011: begin // ON state
							mux_sel_out = 1'b0;
							x1_set_out = 1'b0;
							x2_set_out = 1'b0;
							x3_set_out = 1'b0;
							x4_set_out = 1'b0;
							t0_start_out = 1'b0;
							t1_start_out = 1'b1;
							t2_start_out = 1'b0;
							led_out = 1'b1;
						end

		3'b100: begin // DEC state
							mux_sel_out = 1'b1;
							x1_set_out = 1'b0;
							x2_set_out = 1'b0;
							x3_set_out = 1'b0;
							x4_set_out = 1'b1;
							t0_start_out = 1'b0;
							t1_start_out = 1'b0;
							t2_start_out = 1'b0;
							led_out = 1'b1;
						end

		3'b101: begin // OFF state
							mux_sel_out = 1'b0;
							x1_set_out = 1'b0;
							x2_set_out = 1'b0;
							x3_set_out = 1'b1;
							x4_set_out = 1'b1;
							t0_start_out = 1'b1;
							t1_start_out = 1'b0;
							t2_start_out = 1'b0;
							led_out = 1'b0;
						end

		3'b110: begin // IDLE state
							mux_sel_out = 1'b0;
							x1_set_out = 1'b0;
							x2_set_out = 1'b0;
							x3_set_out = 1'b1;
							x4_set_out = 1'b1;
							t0_start_out = 1'b0;
							t1_start_out = 1'b0;
							t2_start_out = 1'b1;
							led_out = 1'b0;
						end
		default: begin // NONE state
							mux_sel_out = 1'b0;
							x1_set_out = 1'b0;
							x2_set_out = 1'b0;
							x3_set_out = 1'b0;
							x4_set_out = 1'b0;
							t0_start_out = 1'b0;
							t1_start_out = 1'b0;
							t2_start_out = 1'b0;
							led_out = 1'b0;
						end
	endcase
end

// Sequential logic
always @(posedge clock_in, posedge reset_in)
begin
	if(reset_in == 1'b1)	// Resets the state machine
		state_reg = 3'b000;
	else
		case (state_reg)
			3'b000: state_reg = 3'b001;
			3'b001: state_reg = 3'b010;
			3'b010: state_reg = 3'b011;
			3'b011: if(t1_int_in)
								state_reg = 3'b100;
							else:
								state_reg = 3'b011;
			3'b100: if (zero_flag_in)
								state_reg = 3'b110;
							else
								state_reg = 3'b101;
			3'b101: if (t0_int_in)
								state_reg = 3'b011;
							else
								state_reg = 3'b101;
			3'b110: if(t2_int_in)
								state_reg = 3'b000;
							else
								state_reg = 3'b110;
		endcase
end

endmodule
