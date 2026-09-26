module decoder3to8(
    input logic [2:0]din,
    input logic en,
    output logic d0, d1, d2, d3, d4, d5, d6, d7
);

always_comb begin
    d0 = 0;
    d1 = 0;
    d2 = 0;
    d3 = 0;
    d4 = 0;
    d5 = 0;
    d6 = 0;
    d7 = 0;
if(en)
    case(din)
    3'b000: d0 = 1;
    3'b001: d1 = 1;
    3'b010: d2 = 1;
    3'b011: d3 = 1;
    3'b100: d4 = 1;
    3'b101: d5 = 1;
    3'b110: d6 = 1;
    3'b111: d7 = 1;
    default: 
    d0 = 0;
    d1 = 0;
    d2 = 0;
    d3 = 0;
    d4 = 0;
    d5 = 0;
    d6 = 0;
    d7 = 0;
    endcase
end
endmodule

