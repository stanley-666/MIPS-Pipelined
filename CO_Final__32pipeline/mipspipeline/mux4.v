
module mux4( sel, a, b, c, d, y );
    parameter bitwidth=32;
    input[1:0] sel;
    input  [bitwidth-1:0] a, b, c, d;
    output [bitwidth-1:0] y;

    assign y = sel[1] ? (sel[0] ? d:c):(sel[0] ? b:a);
endmodule