module aes_top (
    input clk,
    input rst_n,
    
    input [127:0] mkey,
    input load_mkey,
    input [127:0] plaintext,
    input din_valid,
    output [127:0] ciphertext,
    output dout_valid,
    
    output busy
);
    wire [1407:0] round_keys_flatten;
    wire encrypt_busy;
    wire key_expand_busy;
 
    assign busy = encrypt_busy | key_expand_busy;
 
    encrypt u_en (
        .clk(clk),
        .rst_n(rst_n),
        .din_valid(din_valid),
        .plaintext(plaintext),
        .ciphertext(ciphertext),
        .dout_valid(dout_valid),
        .busy(encrypt_busy),
        .round_keys_flatten(round_keys_flatten)
    );
 
    key_expand u_ke (
        .clk(clk),
        .rst_n(rst_n),
        .load_mkey(load_mkey),
        .mkey(mkey),
        .round_keys_flatten(round_keys_flatten),
        .busy(key_expand_busy)
    );
endmodule
