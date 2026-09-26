module mulby3(
input logic en,
input logic [5:0]mult_in,
output logic [7:0]mult_out
);

always_comb begin
    if(en)
    mult_out = mult_in + mult_in + mult_in;
    else
    mult_out = 8'b0;
end

endmodule
