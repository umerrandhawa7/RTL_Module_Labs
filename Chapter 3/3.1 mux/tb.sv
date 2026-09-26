module tb;

logic [4:0] a0, a1, a2, a3, a4, a5, a6, a7;
logic [2:0] sel;

logic [4:0] dout;

mux8to1 dut (
.a0(a0),
.a1(a1),
.a2(a2),
.a3(a3),
.a4(a4),
.a5(a5),
.a6(a6),
.a7(a7),
.sel(sel),
.dout(dout)
);

initial begin

// Give each input different value
a0 = 5'b00001;
a1 = 5'b00010;
a2 = 5'b00011;
a3 = 5'b00100;
a4 = 5'b00101;
a5 = 5'b00110;
a6 = 5'b00111;
a7 = 5'b01000;

// Test a0
sel = 3'b000;
#10;

// Test a1
sel = 3'b001;
#10;

// Test a2
sel = 3'b010;
#10;

// Test a3
sel = 3'b011;
#10;

// Test a4
sel = 3'b100;
#10;

// Test a5
sel = 3'b101;
#10;

// Test a6
sel = 3'b110;
#10;

// Test a7
sel = 3'b111;
#10;

$finish;
end

endmodule