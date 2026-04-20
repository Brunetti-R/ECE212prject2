module led_tb();

    reg [3:0] in;
    wire [7:0] out;
    integer i, outfile;
    led_voltmeter uut(in, out);

    initial begin
        $dumpvars(0, led_tb);
        outfile = $fopen("led_out.txt", "w");
        $fmonitor(outfile, "in:%b out:%b", in, out);
        in = 0;
        for (i = 0; i < 15; i = i + 1) begin
            #1 in = in + 1;
        end
        #1;
        $fclose(outfile);
        $finish;
    end

endmodule