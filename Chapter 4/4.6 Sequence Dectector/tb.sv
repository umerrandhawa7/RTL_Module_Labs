module tb_sequence_detector;

logic clk;
logic reset;
logic d_in;
logic detected;

sequence_dectector_0110_0101 dut(
.clk(clk),
.reset(reset),
.d_in(d_in),
.detected(detected)
);
  
// Dump signals
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_sequence_detector);
end
  
// clock
initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
reset = 1;
d_in = 0;

// reset
@(posedge clk);
reset = 0;

// 0110
@(negedge clk) d_in = 0;
@(negedge clk) d_in = 1;
@(negedge clk) d_in = 1;
@(negedge clk) d_in = 0;

@(posedge clk);

// 0101
@(negedge clk) d_in = 0;
@(negedge clk) d_in = 1;
@(negedge clk) d_in = 0;
@(negedge clk) d_in = 1;

@(posedge clk);

#10;
$finish;

end
endmodule