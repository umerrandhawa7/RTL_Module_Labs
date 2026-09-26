module tb_edge_detect;

logic in_sign;
logic clk;
logic reset;
logic p_edge;
logic n_edge;
logic [7:0] count;

edge_detect dut(
.in_sign(in_sign),
.clk(clk),
.reset(reset),
.p_edge(p_edge),
.n_edge(n_edge),
.count(count)
);

always #5 clk = ~clk;

initial begin
clk     = 0;
reset   = 1;
in_sign = 0;
p_edge  = 0;
n_edge  = 0;

// Reset
#10;
reset = 0;

p_edge = 1;
n_edge = 0;

#10 in_sign = 1;   // count
#10 in_sign = 0;   //dont count
#10 in_sign = 1;   // count
#10 in_sign = 0;   //dont count

//negedge
p_edge = 0;
n_edge = 1;

#10 in_sign = 1;  
#10 in_sign = 0; 
#10 in_sign = 1;   
#10 in_sign = 0;  

// both edges
p_edge = 1;
n_edge = 1;

#10 in_sign = 1;  
#10 in_sign = 0;  
#10 in_sign = 1;   
#10 in_sign = 0;

#10;

$finish;
end
endmodule