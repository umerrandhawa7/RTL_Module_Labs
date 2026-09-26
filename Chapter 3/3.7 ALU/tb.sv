module alu_tb;

logic clk;
logic reset;
logic [31:0]a;
logic [31:0]b;
logic [3:0]op_code;

logic zero;
logic over_flow;
logic carry_out;
logic [31:0]dout;

alu dut(
.clk(clk),
.reset(reset),
.a(a),
.b(b),
.op_code(op_code),
.zero(zero),
.over_flow(over_flow),
.carry_out(carry_out),
.dout(dout)
);

always #5 clk = ~clk;

initial begin
clk = 0;
reset = 1;
a = 0;
b = 0;
op_code = 0;

#10;
reset = 0;

// add
a = 10;
b = 5;
op_code = 4'b0000;
#10;

// subtract
a = 10;
b = 5;
op_code = 4'b0001;
#10;

// and
a = 32'hFF00FF00;
b = 32'h0F0F0F0F;
op_code = 4'b0010;
#10;

// or
a = 32'hFF00FF00;
b = 32'h0F0F0F0F;
op_code = 4'b0011;
#10;

// xor
a = 32'hFF00FF00;
b = 32'h0F0F0F0F;
op_code = 4'b0100;
#10;

// right shift
a = 32'h00000010;
op_code = 4'b0101;
#10;

// left shift
a = 32'h00000010;
op_code = 4'b0110;
#10;

// barrel shift
a = 32'h00000001;
b = 4;
op_code = 4'b0111;
#10;

// add with carry
a = 32'hFFFFFFFF;
b = 1;
op_code = 4'b0000;
#10;

// zero result
a = 5;
b = 5;
op_code = 4'b0001;
#10;

// signed overflow
a = 32'h7FFFFFFF;
b = 1;
op_code = 4'b0000;
#10;

$finish;
end

endmodule