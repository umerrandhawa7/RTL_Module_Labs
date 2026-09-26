module fifo_tb;

logic clk;
logic reset;

logic [7:0] d_in;
logic d_in_valid;
logic d_out_req;

logic [7:0] d_out;
logic empty;
logic full;

// DUT
fifo dut(
.clk(clk),
.reset(reset),

.d_in(d_in),
.d_in_valid(d_in_valid),
.d_out_req(d_out_req),

.d_out(d_out),
.empty(empty),
.full(full)
);

always #5 clk = ~clk;

initial begin
clk = 0;
reset = 1;
d_in = 0;
d_in_valid = 0;
d_out_req = 0;

#10; reset = 0; //reset

@(posedge clk);
d_in = 8'd10;   //write 10
d_in_valid = 1;
@(posedge clk);
d_in_valid = 0;

@(posedge clk);
d_in = 8'd20;   //write 20
d_in_valid = 1;
@(posedge clk);
d_in_valid = 0;

@(posedge clk);
d_in = 8'd30;   //write 30
d_in_valid = 1;
@(posedge clk);
d_in_valid = 0;

// reading
@(posedge clk);
d_out_req = 1;
@(posedge clk);
d_out_req = 0;

@(posedge clk);
d_out_req = 1;
@(posedge clk);
d_out_req = 0;

@(posedge clk);
d_out_req = 1;
@(posedge clk);
d_out_req = 0;

#20;
$finish;
end
endmodule