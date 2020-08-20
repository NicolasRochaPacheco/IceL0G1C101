

module dec (
  data_in,
  data_out
);

// Parameter definition
parameter DATA_WIDTH = 4;

// Input and output definition
input [DATA_WIDTH-1:0] data_in;
output [DATA_WIDTH-1:0] data_out;

wire [DATA_WIDTH-1:0] data_wire;

// Combinational logic
always @ ( * ) begin
  if(data_in == 0)
    data_wire = 0;
  else
    data_wire = data_in - 1;
end

assign data_out = data_wire;

endmodule
