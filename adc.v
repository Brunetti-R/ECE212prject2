module adc(
    input compare, clk,
    output reg [4:0] dac_out,
    output reg [3:0] adc_out
);
    //Do not modify above this line!!!

    reg sample_phase;
    reg cmp_sample;

    initial begin
        dac_out = 5'd0;
        adc_out = 4'd0;
        sample_phase = 1'b1;
        cmp_sample = 1'b0;
    end

    always @(posedge clk) begin
        if (sample_phase) begin
            cmp_sample <= compare;
            if (compare) begin
                adc_out <= dac_out[4:1];
            end
            sample_phase <= 1'b0;
        end else begin
            if (cmp_sample) begin
                dac_out <= 5'd0;
            end else if (dac_out != 5'd31) begin
                dac_out <= dac_out + 5'd1;
            end
            sample_phase <= 1'b1;
        end
    end

endmodule
