module tb_syn_sc_ff;

logic clk;
logic din;
logic set;
logic clear;
logic out;

// instantiate
syn_sc_ff dut(
.clk(clk),
.din(din),
.set(set),
.clear(clear),
.out(out)
);

always #5 clk = ~clk;

initial begin
clk   = 0;
din   = 0;
set   = 0;
clear = 0;

// Clear
#10;
clear = 1;
#10;
clear = 0;

// Load din = 1
din = 1;
#10;

// Load din = 0
din = 0;
#10;

// Set
set = 1;
#10;
set = 0;

// Clear
clear = 1;
#10;
clear = 0;

#10;
$finish;
end
endmodule