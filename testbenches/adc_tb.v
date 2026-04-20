module adc_tb();
    reg compare;
    reg clk;    
    wire [4:0] dac_out;
    wire [3:0] adc_out;
    integer outfile, i ,j;
    adc uut(compare, clk, dac_out, adc_out);

    always begin
        #1
        clk = ~clk;
    end
        
    initial begin
        $dumpvars(0, adc_tb);
        outfile = $fopen("adc_out.txt", "w");
        $fmonitor(outfile, "clk:%b compare:%b dac_out:%b adc_out:%b", clk, compare, dac_out, adc_out);
        clk = 0;
        compare = 0;

        for (i = 0; i < 64; i = i+2) begin
            for (j = 0; j < i; j = j+1) begin
                #2;
            end
            compare = 1;
            #2
            compare = 0;
        end


        $fclose(outfile);
        $finish;
    end

endmodule