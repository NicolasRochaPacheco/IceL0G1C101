

module dec (
  data_in,
  data_out
);

// Parameter definition
parameter DATA_WIDTH = 4;

// Input and output definition
input [DATA_WIDTH-1:0] data_in;
output reg [DATA_WIDTH-1:0] data_out;

// Combinational logic
always @ ( * ) begin
  data_out = data_in - 1;
end

endmodule
