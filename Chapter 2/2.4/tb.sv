module tb();

logic clk;
logic [7:0]din;
logic [1:0]c;
logic [7:0]dout;

counter count(
.clk(clk),
.din(din),
.c(c),
.dout(dout)
);

initial begin
    clk = 0;
end
    always #5 clk = ~clk;

initial begin
     din=0; c= 2'b11;
#10; din=4; c= 2'b00;
#10;        c= 2'b01;
#10; c= 2'b10;
#10; c = 2'b11;
#5;
$finish;
end

endmodule
