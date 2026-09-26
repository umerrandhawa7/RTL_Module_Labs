```systemverilog
module alu(
input logic clk,
input logic reset,
input logic [31:0] a,
input logic [31:0] b,
input logic [3:0] op_code,
output logic zero,
output logic over_flow,
output logic carry_out,
output logic [31:0] dout
);

logic [32:0] temp;
logic [31:0] result;

always_ff @(posedge clk) begin
    if(reset) begin
        dout <= 32'b0;
        zero <= 1'b0;
        over_flow <= 1'b0;
        carry_out <= 1'b0;
        temp <= 33'b0;
    end
    else begin
        carry_out <= 1'b0;
        over_flow <= 1'b0;

        case(op_code)

            // ADD
            4'b0000: begin
                temp = {1'b0,a} + {1'b0,b};
                dout <= temp[31:0];
                carry_out <= temp[32];
                over_flow <= (~(a[31] ^ b[31])) & (temp[31] ^ a[31]);
                zero <= (temp[31:0] == 0);
            end

            // SUBTRACT
            4'b0001: begin
                result = a - b;
                dout <= result;
                zero <= (result == 0);
                over_flow <= (a[31] ^ b[31]) & (result[31] ^ a[31]);
            end

            // AND
            4'b0010: begin
                result = a & b;
                dout <= result;
                zero <= (result == 0);
            end

            // OR
            4'b0011: begin
                result = a | b;
                dout <= result;
                zero <= (result == 0);
            end

            // XOR
            4'b0100: begin
                result = a ^ b;
                dout <= result;
                zero <= (result == 0);
            end

            // SHIFT RIGHT
            4'b0101: begin
                result = a >> 1;
                dout <= result;
                zero <= (result == 0);
            end

            // SHIFT LEFT
            4'b0110: begin
                result = a << 1;
                dout <= result;
                zero <= (result == 0);
            end

            // BARREL SHIFT
            4'b0111: begin
                result = a << b[4:0];
                dout <= result;
                zero <= (result == 0);
            end

            default: begin
                dout <= 32'b0;
                zero <= 1'b1;
                over_flow <= 1'b0;
                carry_out <= 1'b0;
            end

        endcase
    end
end

endmodule