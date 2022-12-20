module adder_ex(input [3:0]a,
                input [3:0]b,
                input clk,
                input rst,
                output reg [3:0]sum,
                output reg cout);

  always@(posedge clk) begin
    if(!rst)begin
      sum = 4'b0000;
      cout=1'b0;
    end

    else
      {cout,sum} = a+b;
  end

endmodule
