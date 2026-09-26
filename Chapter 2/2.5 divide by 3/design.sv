module divider_by3(
    input logic [15:0]din,
    output logic [14:0]result,
    output logic [1:0]remainder
);

logic [15:0] temp;

always_comb begin
    result = 0;
    remainder = 0;
    for(temp = din; temp >= 3; temp = temp - 3) begin
        result = result + 1;
    end
    remainder = temp;
end
endmodule
