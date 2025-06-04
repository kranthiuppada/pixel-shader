module pixel_shader_cdc #(
    parameter WIDTH = 8
)(
    input clk,              // Target clock
    input clk_in,           // Source clock (asynchronous)
    input rst_n,
    input pixel_valid_in_async,
    input [WIDTH-1:0] pixel_in_r_async,
    input [WIDTH-1:0] pixel_in_g_async,
    input [WIDTH-1:0] pixel_in_b_async,
    
    output reg pixel_valid_out,
    output reg [WIDTH-1:0] pixel_out_r,
    output reg [WIDTH-1:0] pixel_out_g,
    output reg [WIDTH-1:0] pixel_out_b
);

    // CDC sync registers for valid signal
    reg valid_sync_0, valid_sync_1;
    reg [WIDTH-1:0] r_sync_0, r_sync_1;
    reg [WIDTH-1:0] g_sync_0, g_sync_1;
    reg [WIDTH-1:0] b_sync_0, b_sync_1;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            valid_sync_0 <= 0; valid_sync_1 <= 0;
            r_sync_0 <= 0; r_sync_1 <= 0;
            g_sync_0 <= 0; g_sync_1 <= 0;
            b_sync_0 <= 0; b_sync_1 <= 0;
        end else begin
            valid_sync_0 <= pixel_valid_in_async;
            valid_sync_1 <= valid_sync_0;

            r_sync_0 <= pixel_in_r_async;
            r_sync_1 <= r_sync_0;

            g_sync_0 <= pixel_in_g_async;
            g_sync_1 <= g_sync_0;

            b_sync_0 <= pixel_in_b_async;
            b_sync_1 <= b_sync_0;
        end
    end

    // Process inverted data
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pixel_out_r <= 0;
            pixel_out_g <= 0;
            pixel_out_b <= 0;
            pixel_valid_out <= 0;
        end else begin
            pixel_out_r <= ~r_sync_1;
            pixel_out_g <= ~g_sync_1;
            pixel_out_b <= ~b_sync_1;
            pixel_valid_out <= valid_sync_1;
        end
    end

endmodule

