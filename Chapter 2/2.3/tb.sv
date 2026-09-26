module tb();

logic [7:0]a;
logic [7:0]b;
logic g;
logic l;
logic e;

compare comp(
.a(a),
.b(b),
.g(g),
.l(l),
.e(e)
);

initial begin 
    a=0; b= 0;
#5; a=4; b= 2;
#5; a=1; b= 6;
#5; a=5; b= 5;
$finish
end
endmodule

