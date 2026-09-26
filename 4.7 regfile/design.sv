module reg_file(
    input logic clk,
    input logic [7:0]d_in,
    output logic [7:0]d_out,
    input logic r_w,
    input logic [3:0]addr_in
);

logic [7:0] regfile [15:0];

always_ff @(posedge clk) begin
    if(r_w)         // write
        regfile[addr_in] <= d_in;
    else                //read
        d_out <= regfile[addr_in];  
end
endmodule
