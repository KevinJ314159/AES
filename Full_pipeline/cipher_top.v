module encrypt (
    input clk,
    input rst_n,
    input din_valid,
    input [127:0] plaintext,
    output [127:0] ciphertext,
    output dout_valid,
    output busy,
    input [1407:0] round_keys_flatten
);
    reg [11:0] round_ctrl;
    reg [127:0] state[0:10];
    wire [127:0] round_out[0:9];
    wire [127:0] round_keys[0:10];
 
    integer i;
    genvar j;
 
    assign {
        round_keys[0], round_keys[1], round_keys[2],
        round_keys[3], round_keys[4], round_keys[5],
        round_keys[6], round_keys[7], round_keys[8],
        round_keys[9], round_keys[10]
    } = round_keys_flatten;
 
    assign ciphertext = state[10];
    assign busy = din_valid | (|round_ctrl);
    assign dout_valid = round_ctrl[10];
 
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            for (i = 0; i < 11; i = i + 1) begin
                state[i] <= 128'h0;
            end
        end else begin
            if (din_valid) begin
                state[0] <= plaintext ^ round_keys[0];
            end
            for (i = 1; i < 11; i = i + 1) begin
                state[i] <= round_out[i-1];
            end
        end
    end
 
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            round_ctrl <= 12'd0;
        end else begin
            round_ctrl <= {round_ctrl[10:0], din_valid};
        end
    end
    generate
        for (j = 0; j < 9; j = j + 1) begin : enr_instances
            encrypt_round u_er (
                .din(state[j]),
                .round_key(round_keys[j+1]),
                .dout(round_out[j])
            );
        end
        encrypt_round_last u_er_last (
            .din(state[9]),
            .round_key(round_keys[10]),
            .dout(round_out[9])
        );
    endgenerate
 
 
endmodule