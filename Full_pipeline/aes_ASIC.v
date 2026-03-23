module aes_ASIC_new (
    input             PAD_clk,
    input             PAD_rst_n,

    input   [127:0]   PAD_mkey,
    input             PAD_load_mkey,
    input   [127:0]   PAD_plaintext,
    input             PAD_din_valid,

    output  [127:0]   PAD_ciphertext,
    output            PAD_dout_valid,
    output            PAD_busy
);

    wire              clk;
    wire              rst_n;

    wire    [127:0]   mkey;
    wire              load_mkey;
    wire    [127:0]   plaintext;
    wire              din_valid;

    wire    [127:0]   ciphertext;
    wire              dout_valid;
    wire              busy;

    //========================================================
    // Input PADs
    //========================================================
    I1025_EW clk_0       ( .PADIO(PAD_clk),       .R_EN(1'b1), .DOUT(clk)   );
    I1025_EW rst_n_0     ( .PADIO(PAD_rst_n),     .R_EN(1'b1), .DOUT(rst_n) );

    I1025_EW load_mkey_0 ( .PADIO(PAD_load_mkey), .R_EN(1'b1), .DOUT(load_mkey) );
    I1025_EW din_valid_0 ( .PADIO(PAD_din_valid), .R_EN(1'b1), .DOUT(din_valid) );

    genvar i;
    generate
        for (i=0; i<128; i=i+1) begin : PAD_IN_GEN
            I1025_EW mkey_pad (
                .PADIO(PAD_mkey[i]),
                .R_EN (1'b1),
                .DOUT (mkey[i])
            );

            I1025_EW plaintext_pad (
                .PADIO(PAD_plaintext[i]),
                .R_EN (1'b1),
                .DOUT (plaintext[i])
            );
        end
    endgenerate

    //========================================================
    // Output PADs
    //========================================================
    genvar j;
    generate
        for (j=0; j<128; j=j+1) begin : PAD_OUT_GEN
            D12I1025_NS ciphertext_pad (
                .DIN  (ciphertext[j]),
                .EN   (1'b1),
                .PADIO(PAD_ciphertext[j])
            );
        end
    endgenerate

    D12I1025_NS dout_valid_0 (
        .DIN  (dout_valid),
        .EN   (1'b1),
        .PADIO(PAD_dout_valid)
    );

    D12I1025_NS busy_0 (
        .DIN  (busy),
        .EN   (1'b1),
        .PADIO(PAD_busy)
    );

    //========================================================
    // Core instantiation
    //========================================================
    aes_top u_aes_top (
        .clk        (clk),
        .rst_n      (rst_n),
        .mkey       (mkey),
        .load_mkey  (load_mkey),
        .plaintext  (plaintext),
        .din_valid  (din_valid),
        .ciphertext (ciphertext),
        .dout_valid (dout_valid),
        .busy       (busy)
    );

endmodule
