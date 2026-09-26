module tb();

// internal signals
    logic a;
    logic b;
    logic cin;
    logic sum;
    logic carry;

// module instiation.
full_adder fa(
.a(a),
.b(b),
.cin(cin),
.sum(sum),
.carry(carry)
);

initial begin
    a = 0; b= 1; cin = 1;
#5; a = 1; b= 1; cin = 1;
#5; a = 1; b= 0; cin = 1;
#5; a = 0; b= 0; cin = 1;

    end
endmodule