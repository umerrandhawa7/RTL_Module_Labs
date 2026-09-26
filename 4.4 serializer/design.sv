module serializer(
    input logic clk,
    input logic reset,
    input logic [7:0]byte_in,
    output logic bit_out
);

logic [7:0] temp;
logic [2:0] count;

always_ff @(posedge clk) begin

if (reset) begin
    temp <= 8'b0;
    count <= 3'b0;
    bit_out <= 1'b0;
end

else if (count == 0) begin
    temp <= byte_in;
    bit_out <= byte_in[0];
    count <= count + 1'b1;
end

else begin
    bit_out <= temp[1];
    temp <= {1'b0, temp[7:1]};
    count <= count + 1'b1;
end

end
endmodule

