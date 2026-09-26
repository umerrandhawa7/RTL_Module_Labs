module tb_counter;

logic clk;
logic reset;
logic up_down;
logic [7:0]count;

counter dut(
.clk(clk),
.reset(reset),
.up_down(up_down),
.count(count)
);

always #5 clk = ~clk;

initial begin
clk     = 0;
reset   = 0;
up_down = 0;

#2;
reset = 1;

#3;
reset = 0;
up_down = 1;

#50;
up_down = 0;

#50;

#2;
reset = 1;

#3;
reset = 0;

#20;
$finish;

end
endmodule