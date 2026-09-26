//counter
module counter(
    input logic clk,
    input logic reset,
    input logic up_down,
    output logic [7:0]count
);

always @(posedge clk or posedge reset) begin

if (reset)
count <= 8'd0;
else if(up_down)
count <= count + 1;
else
count <= count - 1;

end
endmodule

