module tb();

// internal signals
    logic clk;
    logic reset;
    logic load;
    logic add;
    logic [7:0]din;
    logic [7:0]sum;
    logic [7:0]clkcnt;

// module instiation.
design dut(
    .clk(clk),
    .reset(reset),
    .load(load),
    .add(add),
    .din(din),
    .sum(sum),
    .clkcnt(clkcnt)
);

// clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1; load = 0; add = 0; din = 8'd1;
#2; reset = 0;
#2; load = 0; add = 0; din = 8'd4;
#2; load = 0; add = 1; din = 8'd2;
#2; load = 1; add = 0; din = 8'd3;
#2; load = 1; add = 1; din = 8'd6;
    end
endmodule