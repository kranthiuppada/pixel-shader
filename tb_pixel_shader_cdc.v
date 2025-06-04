module tb_pixel_shader_cdc;

    reg clk = 0, clk_in = 0, rst_n = 0;
    reg [7:0] pixel_in_r_async, pixel_in_g_async, pixel_in_b_async;
    reg pixel_valid_in_async;

    wire [7:0] pixel_out_r, pixel_out_g, pixel_out_b;
    wire pixel_valid_out;

    pixel_shader_cdc uut (
        .clk(clk),
        .clk_in(clk_in),
        .rst_n(rst_n),
        .pixel_in_r_async(pixel_in_r_async),
        .pixel_in_g_async(pixel_in_g_async),
        .pixel_in_b_async(pixel_in_b_async),
        .pixel_valid_in_async(pixel_valid_in_async),
        .pixel_out_r(pixel_out_r),
        .pixel_out_g(pixel_out_g),
        .pixel_out_b(pixel_out_b),
        .pixel_valid_out(pixel_valid_out)
    );

    always #5 clk = ~clk;        // 100 MHz
    always #7 clk_in = ~clk_in;  // 71.4 MHz (async domain)

    initial begin
        rst_n = 0;
        pixel_valid_in_async = 0;
        #20 rst_n = 1;

        #20 pixel_in_r_async = 8'hA5;
             pixel_in_g_async = 8'hFF;
             pixel_in_b_async = 8'h00;
             pixel_valid_in_async = 1;

        #14 pixel_valid_in_async = 0;

        #200 $finish;
    end

endmodule
