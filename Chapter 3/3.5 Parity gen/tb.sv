module tb;

logic clk;
logic [31:0]din;
logic [35:0]dout;

// Clock
initial begin
clk = 0;
forever #5 clk = ~clk;
end

parity_gen dut(*);

initial begin
// Reset
din = 12;
#10;

reset = 0;

// Test 1
din = 22;
#10;

// Test 2
din = 232;
#10;

// Test 3
din = 43;
#10;

$finish;
end
endmodule
