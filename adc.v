module adc(
    input compare, clk,
    output reg [4:0] dac_out,
    output reg [3:0] adc_out
);
    //Do not modify above this line!!!

    reg [1:0] phase;
    reg cmp_sample;

    initial begin
        dac_out = 5'd0;
        adc_out = 4'd0;
        phase = 2'd0;
        cmp_sample = 1'b0;
    end

    always @(posedge clk) begin
        case (phase)
            2'd0: begin
                phase <= 2'd1;
            end
            2'd1: begin
                cmp_sample <= compare;
                if (compare) begin
                    adc_out <= dac_out[4:1];
                end
                phase <= 2'd2;
            end
            2'd2: begin

                 if (cmp_sample) begin
                dac_out <= 5'd0;
                end else if (dac_out != 5'd31) begin
                    dac_out <= dac_out + 5'd1;
                end
                phase <= 2'd0;
            end
            default: begin
                phase <= 2'd0;
                dac_out <= 5'd0;
            end
        endcase
    end

endmodule
