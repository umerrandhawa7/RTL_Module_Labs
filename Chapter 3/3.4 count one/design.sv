module count_1(
input logic [7:0]val,
input logic reset,
input logic clk,

output logic [3:0]num,
output logic [2:0]pos
);

interger i;

always_ff @( posedge clk) begin

if (reset) begin
num <= 4'd0;
pos <= 3'd0;
end

else begin
num = 0;
pos = 0;

for(i = 0; i < 8; i++) begin
    if(val[i] == 1)
        num = num + 1;
end
for(i = 0; i < 7; i++) begin
    if(val[i] == 1) begin
        pos = i;
        break;
    end
end  
end


endmodule


// 0110_1100