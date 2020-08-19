

module adder (
  data_a_in,
  data_b_in,
  data_out
);

// Parameter definition
parameter DATA_WIDTH = 4;

// Input and output definition
input [DATA_WIDTH-1:0] data_a_in;
input [DATA_WIDTH-1:0] data_b_in;
output reg [DATA_WIDTH-1:0] data_out;

// Combinational logic
always @ ( * ) begin
  data_out = data_a_in + data_b_in;
end

endmodule
