module parity_gen(
input logic clk,
input logic [31:0]din,
output logic [35:0]dout,
);

always_ff @(posedge clk) begin
dout[31:0] <= ^[31:0]din;
dout[32] <= ^[7:0]din;
dout[33] <= ^[15:8]din;
dout[34] <= ^[23:16]din;
dout[35] <= ^[31:24]din;
    
end



endmodule
