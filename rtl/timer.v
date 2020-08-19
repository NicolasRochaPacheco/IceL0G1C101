


module timer (
  clock_in,
  reset_in,
  start_in,
  int_out
);

// Parameter definition
parameter DATA_WIDTH = 13;
parameter STOP_VALUE = 8000;

// Input and output definition
input clock_in;
input reset_in;
input start_in;
output reg int_out;

// Register definition
reg enable_reg;
reg [DATA_WIDTH-1:0] counter_reg;

// Sequential logic
always @ (posedge clock_in, posedge reset_in) begin
  if(reset_in)
    begin
      counter_reg = STOP_VALUE;
      enable_reg = 1'b0;
    end
  else
    begin
      if (enable_reg)
        counter_reg = counter_reg - 1'b1;
      else
        counter_reg = counter_reg;

      if (start_in)
        begin
          enable_reg = 1'b1;
          counter_reg = counter_reg - 1'b1;
        end
      else
        begin
          enable_reg = 1'b0;
          counter_reg = counter_reg;
        end
    end

  // Assigns the output value
  if (counter_reg == 0)
    int_out = 1'b1;
  else
    int_out = 1'b0;
end

endmodule
