module tb();

logic clk;
logic [7:0] din;
logic load;
logic shl;
logic shr;
logic [7:0] dout;

shifter shift(
.clk(clk),
.din(din),
.load(load),
.shl(shl),
.shr(shr),
.dout(dout)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    din  = 0;
    load = 0;
    shl  = 0;
    shr  = 0;

    // Load 4
    #10;
    din  = 8'd4;
    load = 1;

    // Shift left
    #10;
    load = 0;
    shl  = 1;

    // Shift left again
    #10;

    // Shift right
    #10;
    shl = 0;
    shr = 1;

    // Hold
    #10;
    shr = 0;

    #10;
    $finish;

end

endmodule