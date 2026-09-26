module tb_serializer;

logic clk;
logic reset;
logic [7:0]byte_in;
logic bit_out;

serializer dut (
.clk(clk),
.reset(reset),
.byte_in(byte_in),
.bit_out(bit_out)
);

always #5 clk = ~clk;

initial begin
clk = 0;
reset = 1;
byte_in = 8'b10110110;

//reset
#10;
reset = 0;

// wait for end of first data
#90;

// another byte
byte_in = 8'b11001001;

#90;
$finish;
end
endmodule