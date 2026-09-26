module pattern_010(
    input logic [31:0]din,
    output logic [3:0]count
);
int i;

always_comb begin
count = 0 ;
for(i = 0; i < 30; i++) begin
    if(din[i] == 0) begin
        if(din[i+1] == 1) begin
            if(din[i+2] == 0) begin
                count = count + 1;
            end
        end
    end
end
end
endmodule



// 32'b0001_1111_0101_1100_1010