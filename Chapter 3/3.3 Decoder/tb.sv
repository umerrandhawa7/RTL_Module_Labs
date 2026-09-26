module tb;

logic [2:0] din;
logic en;

logic d0, d1, d2, d3, d4, d5, d6, d7;

decoder3to8 dut (
.din(din),
.en(en),
.d0(d0),
.d1(d1),
.d2(d2),
.d3(d3),
.d4(d4),
.d5(d5),
.d6(d6),
.d7(d7)
);

initial begin

en = 0;
din = 3'b000;
#10;

// enable = 1
en = 1;

din = 3'b000;
#10;

din = 3'b001;
#10;

din = 3'b010;
#10;

din = 3'b011;
#10;

din = 3'b100;
#10;

din = 3'b101;
#10;

din = 3'b110;
#10;

din = 3'b111;
#10;

// disable
en = 0;
#10;
$finish;
end
endmodule