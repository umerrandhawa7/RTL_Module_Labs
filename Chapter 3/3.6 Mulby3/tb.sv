module tb;

// Testbench signals
logic en;
logic [5:0]mult_in;
logic [7:0]mult_out;

mulby3 dut(
.en(en),
.mult_in(mult_in),
.mult_out(mult_out)
);

initial begin
// Test 1: Enable = 0
en = 0;
mult_in = 6'd10;
#10;

// Test 2: 10 × 3 = 30
en = 1;
mult_in = 6'd10;
#10;

// Test 3: 5 × 3 = 15
mult_in = 6'd5;
#10;

// Test 4: 20 × 3 = 60
mult_in = 6'd20;
#10;

// Test 5: 50 × 3 = 150
mult_in = 6'd50;
#10;

// Test 6: Maximum input
// 63 × 3 = 189
mult_in = 6'd63;
#10;

// Test 7: Disable again
en = 0;
mult_in = 6'd30;
#10;

$finish;
end
endmodule