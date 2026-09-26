module tb_divider_by3;

logic [15:0] din;
logic [14:0] result;
logic [1:0]  remainder;

divider_by3 dut(
.din(din),
.result(result),
.remainder(remainder)
);

initial begin
din = 0;
#10;
// Test 1
din = 1;
#10;
// Test 3
din = 3;
#10;
// Test 10
din = 10;
#10;
// Test 15
din = 15;
#10;
// Test 100
din = 100;
#10;
// Test maximum value
din = 65535;
#10;
$finish;
end
endmodule