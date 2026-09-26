module tb();

// internal signals
     logic in1;
     logic in2;
     logic sel;
     logic out;

// module instiation.
mux_2x1 dut(
    .in1(in1),
    .in2(in2),
    .sel(sel),
    .out(out),
);

initial begin

#2; in1 = 1; in2 = 0; sel = 0;
#2; in1 = 0; in2 = 1; sel = 1;
#2;
$finish;
    end
endmodule
