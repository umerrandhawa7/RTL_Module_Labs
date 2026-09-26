//counter
module counter(
    input logic clk,
    input logic set,
    input logic clear,
    input logic en,
    output logic [7:0]counter_value
);

always @(posedge clk) begin
    if(clear)
    counter_value <= 8'd0;
    else if(set)
    counter_value <= 8'd16;
    else if (en)
    counter_value <= counter_value - 8'd1;
end

endmodule

