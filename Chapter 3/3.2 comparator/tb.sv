module tb;

logic [7:0] a;
logic [7:0] b;

logic eq;
logic gt;
logic lt;

comparator_rel dut (
.a(a),
.b(b),
.eq(eq),
.gt(gt),
.lt(lt)
);

initial begin

// a == b
a = 8'd10;
b = 8'd10;
#10;

// a > b
a = 8'd20;
b = 8'd10;
#10;

// a < b
a = 8'd5;
b = 8'd15;
#10;

a = 8'd255;
b = 8'd0;
#10;

a = 8'd0;
b = 8'd255;
#10;

$finish;
end
endmodule