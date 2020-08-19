
module zero (
  data_in,
  zero_out
);

// Parameter definition
parameter DATA_WIDTH = 4;

// Input and output definition
input [DATA_WIDTH-1:0] data_in;
output reg zero_out;

// Combinational logic
always @ ( * ) begin
  if (data_in == 0)
    zero_out = 1'b1;
  else
    zero_out = 1'b0;
end

endmodule
