module tb_majority_counter;

logic clk;
logic in;
logic out;

majority_counter dut(
.clk(clk),
.in(in),
.out(out)
);

always #5 clk = ~clk;

initial begin
clk = 0;
in  = 0;

#10 in = 0;
#10 in = 0;
#10 in = 0;

#10 in = 1;
#10 in = 0;
#10 in = 0;

#10 in = 1;
#10 in = 1;
#10 in = 0;

#10 in = 1;
#10 in = 0;
#10 in = 1;

#10 in = 0;
#10 in = 1;
#10 in = 0;

#10 in = 1;
#10 in = 1;
#10 in = 1;

#10;
$finish;
end
endmodule