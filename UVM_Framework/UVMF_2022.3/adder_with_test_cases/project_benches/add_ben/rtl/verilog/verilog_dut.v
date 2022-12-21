module verilog_dut(input [3:0]a,
  input [3:0]b,
  input clk,
  input rst,
  output reg [3:0]sum,
  output reg c_out);

  always@(posedge clk) begin
    if(!rst)begin
      sum = 4'b0000;
      c_out=1'b0;
    end
    else
      {c_out,sum} = a+b;
    end

endmodule
