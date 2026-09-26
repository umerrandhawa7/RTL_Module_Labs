module tb();

// internal signals
logic d0, d1, d2, d3, d4, d5, d6, d7;
logic[2:0] sel,
logic out;

// module instiation.
mux_8x1 dut(*);

initial begin

d0 = 0;
d1 = 1;
d2 = 0;
d3 = 1;
d4 = 0;
d5 = 1;
d6 = 0;
d7 = 1;
#10;
sel = 3'b000;   // out should be d0 = 0
#10;
sel = 3'b001;   // out should be d1 = 1
#10;
sel = 3'b010;   // out should be d2 = 0
#10;
sel = 3'b011;   // out should be d3 = 1
#10;
sel = 3'b100;   // out should be d4 = 0
#10;
sel = 3'b101;   // out should be d5 = 1
#10;
sel = 3'b110;   // out should be d6 = 0
#10;
sel = 3'b111;   // out should be d7 = 1
#10;
$finish;

end
endmodule