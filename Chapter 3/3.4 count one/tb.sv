module tb;

logic [7:0] val;
logic reset;
logic clk;
logic [3:0] num;
logic [2:0] pos;

// DUT
count_1 dut (
.val(val),
.reset(reset),
.clk(clk),
.num(num),
.pos(pos)
);

// Clock
initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
// Reset
reset = 1;
val = 8'b0000_0000;
#10;

reset = 0;

// Test 1
val = 8'b0110_1100;
#10;

// Test 2
val = 8'b0000_0001;
#10;

// Test 3
val = 8'b1000_0000;
#10;

$finish;
end
endmodule