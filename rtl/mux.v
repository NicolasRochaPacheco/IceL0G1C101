


module mux (
  sel_in,
  data_a_in,
  data_b_in,
  data_out
);

// Parameter definition
parameter DATA_WIDTH = 4;

// Input and output definition
input sel_in;
input [DATA_WIDTH-1:0] data_a_in;
input [DATA_WIDTH-1:0] data_b_in;
output [DATA_WIDTH-1:0] data_out;

wire [DATA_WIDTH-1:0] data_wire;

// Combinational logic
always @ ( * ) begin
  if (sel_in == 1'b0)
    data_wire = data_a_in;
  else
    data_wire = data_b_in;
end

assign data_out = data_wire;

endmodule
