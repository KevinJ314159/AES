module key_expand (
    input clk,
    input rst_n,
    input load_mkey,
    input [127:0] mkey,
    output [1407:0] round_keys_flatten,
    output busy
);
    reg [9:0] round_ctrl;
    reg [7:0] rcon;
    reg [31:0] w0, w1, w2, w3;
    reg [127:0] round_keys[0:10];
    wire [31:0] sbox_out;
    wire [7:0] rcon_new = {rcon[6:0], 1'b0} ^ (rcon[7] ? 8'h1b : 8'h0);
    wire [31:0] w0_new = w0 ^ {sbox_out[31:24] ^ rcon, sbox_out[23:0]};
    wire [31:0] w1_new = w1 ^ w0_new;
    wire [31:0] w2_new = w2 ^ w1_new;
    wire [31:0] w3_new = w3 ^ w2_new;
 
    wire start_key_expand = load_mkey & ~(|round_ctrl);
 
    integer i;
 
    assign round_keys_flatten = {
        round_keys[0], round_keys[1], round_keys[2],
        round_keys[3], round_keys[4], round_keys[5],
        round_keys[6], round_keys[7], round_keys[8],
        round_keys[9], round_keys[10]
    };
    assign busy = load_mkey | (|round_ctrl);
 
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            rcon <= 8'h00;
            {w0, w1, w2, w3} <= 128'h0;
        end else begin
            if (start_key_expand) begin
                {w0, w1, w2, w3} <= mkey;
                rcon <= 8'h01;
            end else if (|round_ctrl) begin
                {w0, w1, w2, w3} <= {w0_new, w1_new, w2_new, w3_new};
                rcon <= rcon_new;
            end
        end
    end
 
    always @(posedge clk) begin
        if (start_key_expand) begin
            round_keys[0] <= mkey;
        end else if (|round_ctrl) begin
            round_keys[10] <= {w0_new, w1_new, w2_new, w3_new};
            for (i = 10; i > 1; i = i - 1) begin
                round_keys[i-1] <= round_keys[i];
            end
        end
    end
 
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            round_ctrl <= 0;
        end else begin
            if (load_mkey) begin
                round_ctrl <= 1;
            end else if (busy) begin
                round_ctrl <= {round_ctrl[8:0], 1'b0};
            end
        end
    end
    sbox sbox1 (.s_in (w3[31:24]), .s_out(sbox_out[7:0]));
    sbox sbox2 (.s_in (w3[7:0]), .s_out(sbox_out[15:8]));
    sbox sbox3 (.s_in (w3[15:8]), .s_out(sbox_out[23:16]));
    sbox sbox4 (.s_in (w3[23:16]), .s_out(sbox_out[31:24]));
 
endmodule