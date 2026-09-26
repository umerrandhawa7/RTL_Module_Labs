module syn_sc_ff(
    input logic clk,
    input logic din,
    input logic set,
    input logic clear,
    output logic out
);

always @(posedge clk) begin
    if(clear)
    out <= 1'b0;
    else if(set)
    out <= 1'b1;
    else
    out <= din;
end

endmodule