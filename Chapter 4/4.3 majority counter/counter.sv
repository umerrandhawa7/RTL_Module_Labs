module majority_counter(
input logic clk,
input logic in,
output logic out
);

logic sample1;
logic sample2;
logic sample3;

always_ff @(posedge clk) begin
sample1 <= in;
sample2 <= sample1;
sample3 <= sample2;
end

always_comb begin
out = (sample1 & sample2) |
    (sample1 & sample3) |
    (sample2 & sample3);
end
endmodule

