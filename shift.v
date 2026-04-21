module shift_reg(
    input [7:0] data_in,
    input clk_in,
    output reg strobe, data_out, clk_out
);
    //Do not modify above this line!!!
    reg [3:0] state, next_state;
    initial state = s0;

    parameter s0 = 0,
              s1 = 1,
              s2 = 2,
              s3 = 3,
              s4 = 4,
              s5 = 5,
              s6 = 6,
              s7 = 7,
              s8 = 8,
              s9 = 9,
              s10 = 10,
              s11 = 11,
              s12 = 12,
              s13 = 13,
              s14 = 14,
              s15 = 15;


    always @(*) begin
        if(state < 15) begin
            next_state = state + 1;
        end else next_state = s0;
    end


    always @(posedge clk_in) begin
        state <= next_state;
    end

    always @(posedge clk_in) begin
        case(state)
            s0: begin
                data_out <= data_in[7];
                clk_out <= 0;
                strobe <= 1;
            end
            s1: begin
                data_out <= data_in[7];
                clk_out <= 1;
                strobe <= 0;
            end
            s2: begin
                 data_out <= data_in[6];
                 clk_out <= 0;
                 strobe <= 0;
            end
            s3: begin
                data_out <= data_in[6];
                clk_out <= 1;
                strobe <= 0;
            end
            s4: begin
                data_out <= data_in[5];
                clk_out <= 0;
                strobe <= 0;
            end
            s5: begin
                data_out <= data_in[5];
                clk_out <= 1;
                strobe <= 0;
            end
            s6: begin
                data_out <= data_in[4];
                clk_out <= 0;
                strobe <= 0;
            end
            s7: begin
                data_out <= data_in[4];
                clk_out <= 1;
                strobe <= 0;
            end
            s8: begin
                data_out <= data_in[3];
                clk_out <= 0;
                strobe <= 0;
            end
            s9: begin
                data_out <= data_in[3];
                clk_out <= 1;
                strobe <= 0;
            end
            s10: begin
                data_out <= data_in[2];
                clk_out <= 0;
                strobe <= 0;
            end
            s11: begin
                data_out <= data_in[2];
                clk_out <= 1;
                strobe <= 0;
            end
            s12: begin
                data_out <= data_in[1];
                clk_out <= 0;
                strobe <= 0;
            end
            s13: begin
                data_out <= data_in[1];
                clk_out <= 1;
                strobe <= 0;
            end
            s14: begin
                data_out <= data_in[0];
                clk_out <= 0;
                strobe <= 0;
            end
            s15: begin
                data_out <= data_in[0];
                clk_out <= 1;
                strobe <= 0;
            end
            default: begin
                data_out <= data_in[7];
                clk_out <= 0;
                strobe <= 1;
            end
        endcase

    end


endmodule
