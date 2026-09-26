module tb_counter;

logic clk;
logic set;
logic clear;
logic en;
logic [7:0]counter_value;

//instantiate
counter dut(
.clk(clk),
.set(set),
.clear(clear),
.en(en),
.counter_value(counter_value)
);

always #5 clk = ~clk;

initial begin
clk   = 0;
set   = 0;
clear = 0;
en    = 0;

// Test CLEAR
#10;
clear = 1;
#10;
clear = 0;

// Test SET
#10;
set = 1;
#10;
set = 0;

// Test COUNT DOWN
en = 1;
#50;

// Test HOLD
en = 0;
#30;

// Test CLEAR again
clear = 1;
#10;
clear = 0;

#10;
$finish;
end
endmodule