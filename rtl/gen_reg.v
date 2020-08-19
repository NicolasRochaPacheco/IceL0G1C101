


module gen_reg (
  clock_in,
  reset_in,
  set_in,
  data_in,
  data_out
);

// Parameter definition
parameter DATA_WIDTH = 4;
parameter RESET_VALUE = 0;

// Input and output definition
input clock_in;
input reset_in;
input set_in;
input [DATA_WIDTH-1:0] data_in;
output [DATA_WIDTH-1:0] data_out;

// Register definition
reg [DATA_WIDTH-1:0] data_hold;
reg [DATA_WIDTH-1:0] data_store;

// Combinational logic
always @ ( * ) begin
  if(set_in)
    data_hold = data_in;
  else
    data_hold = data_hold;
end

// Sequential logic
always @ ( posedge clock_in, posedge reset_in ) begin
  if (reset_in == 1'b1)
    data_store = RESET_VALUE;
  else
    data_store = data_hold;
end

// Ouput assignment
assign data_out = data_store;


endmodule
