module tb_reg_file;

logic clk;
logic [7:0]d_in;
logic [7:0]d_out;
logic r_w;
logic [3:0]addr_in;

reg_file dut(
.clk(clk),
.d_in(d_in),
.d_out(d_out),
.r_w(r_w),
.addr_in(addr_in)
);

always #5 clk = ~clk;

initial begin
clk = 0;
d_in = 0;
r_w = 0;
addr_in = 0;

// writing register 3
@(negedge clk);
r_w = 1;
addr_in = 4'd3;
d_in = 8'b10101010;

@(posedge clk);

// writing register 5
@(negedge clk);
addr_in = 4'd5;
d_in = 8'b11001100;

@(posedge clk);

// read register 3
@(negedge clk);
r_w = 0;
addr_in = 4'd3;

@(posedge clk);

// read register 5
@(negedge clk);
addr_in = 4'd5;

@(posedge clk);

// writing register 10
@(negedge clk);
r_w = 1;
addr_in = 4'd10;
d_in = 8'b11110000;

@(posedge clk);

// read register 10
@(negedge clk);
r_w = 0;
addr_in = 4'd10;

@(posedge clk);


#10;
$finish;
end
endmodule