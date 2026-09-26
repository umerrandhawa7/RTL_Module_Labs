module fifo(
input logic clk,
input logic reset,
input logic [7:0] d_in,
input logic d_in_valid,
input logic d_out_req,

output logic [7:0] d_out,
output logic empty,
output logic full
);

logic [7:0] fifo [0:127];

logic [6:0] write_ptr;
logic [6:0] read_ptr;

logic [7:0] count;

always_ff @(posedge clk) begin

if (reset) begin
write_ptr <= 7'd0;
read_ptr <= 7'd0;
count <= 8'd0;
d_out <= 8'd0;
end

else begin 

// write
if (d_in_valid && !full) begin
fifo[write_ptr] <= d_in;
write_ptr <= write_ptr + 1'b1;
end

// read
if (d_out_req && !empty) begin
d_out <= fifo[read_ptr];
read_ptr <= read_ptr + 1'b1;
end

// count
if ((d_in_valid && !full) && !(d_out_req && !empty)) begin
count <= count + 1'b1;
end

else if (!(d_in_valid && !full) && (d_out_req && !empty)) begin
count <= count - 1'b1;
end

else begin
count <= count;
end
end
end

assign empty = (count == 8'd0);
assign full = (count == 8'd128);

endmodule