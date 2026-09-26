module compare(
    input logic [7:0]a,
    input logic [7:0]b,
    output logic g,
    output logic l,
    output logic e
);

always_comb begin
    g = 0;
l = 0;
e = 0; 
    if(a>b)
        g = 1;
    else if (a<b)
        l = 1;
    else
        e = 1;
end
endmodule

