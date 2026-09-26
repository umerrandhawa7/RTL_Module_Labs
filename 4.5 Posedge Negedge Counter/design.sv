module edge_detect(
    input logic in_sign,
    input logic clk,
    input logic reset,
    input logic p_edge,
    input logic n_edge,
    output logic [7:0]count
);

logic previous;

always_ff @(posedge clk) begin
if(reset) begin
    previous <= 0;
    count <= 0;
end
else begin
    if (p_edge && !previous && in_sign)         //posedge
    count <= count + 8'd1;

    else if (n_edge && previous && !in_sign)     //negedge
    count <= count + 8'd1;

    previous <= in_sign;

end

end
endmodule
