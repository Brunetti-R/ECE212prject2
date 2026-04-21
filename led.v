module led_voltmeter(
    input [3:0] in,
    output reg [7:0] out
);
    //Do not modify above this line!!!


    always @(*) begin

        case(in)
        0: out = 0;
        1: out = 1;
        2: out = 3;
        3: out = 2;
        4: out = 6;
        5: out = 4;
        6: out = 12;
        7: out = 8;
        8: out = 24;
        9: out = 16;
        10: out = 48;
        11: out = 32;
        12: out = 96;
        13: out = 64;
        14: out = 192;
        15: out = 128;
        default: out = 255;

        endcase
    end
endmodule