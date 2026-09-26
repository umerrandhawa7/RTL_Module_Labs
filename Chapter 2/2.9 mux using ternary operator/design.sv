module mux_8x1(
    input logic d0,
    input logic d1,
    input logic d2,
    input logic d3,
    input logic d4,
    input logic d5,
    input logic d6,
    input logic d7,
    input logic[2:0] sel,
    output logic out
);

assign out = (sel == 3'b000) ? d0:
             (sel == 3'b001) ? d1:
             (sel == 3'b010) ? d2:
             (sel == 3'b011) ? d3:
             (sel == 3'b100) ? d4:
             (sel == 3'b101) ? d5:
             (sel == 3'b110) ? d6:
                               d7;
endmodule