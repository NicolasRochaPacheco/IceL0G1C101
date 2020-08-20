


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
reg [1:0] status_reg;
reg [DATA_WIDTH-1:0] counter_reg;

// Combinational logic
always @ ( * ) begin
  case (status_reg)
    2'b00: int_out = 1'b0;
    2'b01: int_out = 1'b0;
    2'b10: int_out = 1'b1;
    default: int_out = 1'b0;
  endcase
end

// Sequential logic
always @ (posedge clock_in, posedge reset_in) begin
  if(reset_in) begin
    status_reg = 2'b00;
    counter_reg = STOP_VALUE;
  end else begin
    case (status_reg)
      2'b00:  if(start_in == 1'b1)
                status_reg = 2'b01;
              else begin
                status_reg = status_reg;
                counter_reg = STOP_VALUE;
              end

      2'b01:  if(counter_reg == 0)
                status_reg = 2'b10;
              else begin
                counter_reg = counter_reg - 1;
                status_reg = status_reg;
              end
      2'b10:  status_reg = 2'b00;
      default: status_reg = 2'b00;
    endcase
  end
end


endmodule
