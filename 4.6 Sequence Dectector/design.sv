module sequence_dectector_0110_0101(
input logic clk,
input logic reset,
input logic d_in,

output logic detected
);

typedef enum logic [2:0] {
    S0,
    S1,
    S2,
    S3,
    S4
} state;

state current_state, next_state;

always_ff@(posedge clk or posedge reset) begin
if(reset)
  current_state <= S0;
else 
	current_state <= next_state;
end

// next state logic and output logic
always_comb begin
next_state = S0;
detected = 1'b0;

case(current_state)

S0: begin
    if (d_in == 1'b0)
        next_state = S1;
    else
        next_state = S0;
end

// Saw 0
S1: begin
    if (d_in == 1'b1)
        next_state = S2;
    else
        next_state = S1;
end

// Saw 01
S2: begin
    if (d_in == 1'b1)
        next_state = S3;       // 011
    else
        next_state = S4;       // 010
end

// Saw 011
S3: begin
    if (d_in == 1'b0) begin
        detected = 1'b1;       // 0110 detected
        next_state = S0;
    end
    else
        next_state = S0;
end

// Saw 010
S4: begin
    if (d_in == 1'b1) begin
        detected = 1'b1;       // 0101 detected
        next_state = S0;
    end
    else
        next_state = S1;
end

default: begin
    next_state = S0;
    detected = 1'b0;
end
endcase
end

endmodule