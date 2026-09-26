module mux8to1(
    input logic [4:0]a0, a1, a2, a3, a4, a5, a6, a7,
    input logic [2:0]sel,
    output logic [4:0]dout
);

assign dout = sel[2] ? 
              (sel[1] ? 
                (sel[0] ? a7 : a6) : 
                (sel[0] ? a5 : a4)) : 
                (sel[1] ? 
                (sel[0] ? a3 : a2) : 
                (sel[0] ? a1 : a0));

endmodule

