module counter(
    input logic clk,
    input logic [7:0] din,
    input logic shl,
    input logic shr,
    input logic load,
    output logic [7:0] dout
);

always @(posedge clk) begin
    
    if (load)
        dout <= din;

    else if (shl)
        dout <= dout << 1;

    else if (shr)
        dout <= dout >> 1;

end

endmodule
