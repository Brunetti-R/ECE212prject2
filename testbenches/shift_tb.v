module shift_tb();
    reg [7:0] data_in;
    reg clk_in;
    wire strobe, data_out, clk_out;
    integer outfile;
    integer i, j;

    shift_reg uut(data_in, clk_in, strobe, data_out, clk_out);

    always begin
        #1 clk_in = ~clk_in;
    end

    initial begin
        $dumpvars(0, shift_tb);
        outfile = $fopen("shift_out.txt", "w");
        $fmonitor(outfile, "data_in:%b clk_in:%b strobe:%b data_out:%b clk_out:%b", data_in, clk_in, strobe, data_out, clk_out);
        clk_in = 0;
        data_in = 0;
        #32
        data_in = 8'b11001010;
        #32
        data_in = 8'b11110000;
        #32
        data_in = 8'b01011111;
        #32
        data_in = 8'b10101010;
        #32
        $fclose(outfile);
        $finish;
    end

endmodule