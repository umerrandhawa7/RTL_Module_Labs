module counter(
    input logic clk,
    input logic [7:0]din,
    input logic [1:0]c,
    output logic [7:0]dout
);

always @(posedge clk) begin
    
    case(c)
    2'b00: dout = din;
    2'b01: dout = dout + 1;
    2'b10: dout = dout - 1;
    2'b11: dout = 0;
    endcase

end

endmodule
