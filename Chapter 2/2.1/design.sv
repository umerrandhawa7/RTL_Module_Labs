module design(
    input logic clk,
    input logic reset,
    input logic load,
    input logic add,
    input logic [7:0]din,
    output logic [7:0]sum,
    output logic [7:0]clkcnt
);

logic [7:0]loaded_data;

always @(posedge clk) begin
    if(reset) begin
        clkcnt <= 0;
        sum <= 0;     
        loaded_data <= 0;
    end
    else begin
       if (load) begin
       loaded_data <= din;
       end
       if (add) begin
       sum <= loaded_data + clkcnt; 
       end
       clkcnt++

    end
end
endmodule