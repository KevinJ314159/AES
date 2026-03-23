module encrypt_round (
    input [127:0] din,
    input [127:0] round_key,
    output [127:0] dout
);
    wire [127:0] sbox_out, shift_out, mix_out;
 
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : sbox_instances
            sbox u_sbox (
                .s_in (din[i*8+:8]),
                .s_out(sbox_out[i*8+:8])
            );
        end
    endgenerate
 
    assign shift_out[7:0] = sbox_out[39:32];
    assign shift_out[15:8] = sbox_out[79:72];
    assign shift_out[23:16] = sbox_out[119:112];
    assign shift_out[31:24] = sbox_out[31:24];
    assign shift_out[39:32] = sbox_out[71:64];
    assign shift_out[47:40] = sbox_out[111:104];
    assign shift_out[55:48] = sbox_out[23:16];
    assign shift_out[63:56] = sbox_out[63:56];
    assign shift_out[71:64] = sbox_out[103:96];
    assign shift_out[79:72] = sbox_out[15:8];
    assign shift_out[87:80] = sbox_out[55:48];
    assign shift_out[95:88] = sbox_out[95:88];
    assign shift_out[103:96] = sbox_out[7:0];
    assign shift_out[111:104] = sbox_out[47:40];
    assign shift_out[119:112] = sbox_out[87:80];
    assign shift_out[127:120] = sbox_out[127:120];
 
    assign mix_out = mixcolumns(shift_out);
 
    assign dout = mix_out ^ round_key;
 
    function [7:0] gm2(input [7:0] op);
        begin
            gm2 = {op[6:0], 1'b0} ^ (8'h1b & {8{op[7]}});
        end
    endfunction
 
    function [7:0] gm3(input [7:0] op);
        begin
            gm3 = gm2(op) ^ op;
        end
    endfunction
 
    function [31:0] mixw(input [31:0] w);
        reg [7:0] b0, b1, b2, b3;
        reg [7:0] mb0, mb1, mb2, mb3;
        begin
            {b0, b1, b2, b3} = w;
 
            mb0              = gm2(b0) ^ gm3(b1) ^ b2 ^ b3;
            mb1              = b0 ^ gm2(b1) ^ gm3(b2) ^ b3;
            mb2              = b0 ^ b1 ^ gm2(b2) ^ gm3(b3);
            mb3              = gm3(b0) ^ b1 ^ b2 ^ gm2(b3);
 
            mixw             = {mb0, mb1, mb2, mb3};
        end
    endfunction
 
    function [127:0] mixcolumns(input [127:0] data);
        reg [31:0] w0, w1, w2, w3;
        begin
            {w0, w1, w2, w3} = data;
            mixcolumns = {mixw(w0), mixw(w1), mixw(w2), mixw(w3)};
        end
    endfunction
endmodule
module encrypt_round_last (
    input [127:0] din,
    input [127:0] round_key,
    output [127:0] dout
);
    wire [127:0] sbox_out, shift_out, mix_out;
 
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : sbox_instances
            sbox u_sbox (
                .s_in (din[i*8+:8]),
                .s_out(sbox_out[i*8+:8])
            );
        end
    endgenerate
 
    assign shift_out[7:0] = sbox_out[39:32];
    assign shift_out[15:8] = sbox_out[79:72];
    assign shift_out[23:16] = sbox_out[119:112];
    assign shift_out[31:24] = sbox_out[31:24];
    assign shift_out[39:32] = sbox_out[71:64];
    assign shift_out[47:40] = sbox_out[111:104];
    assign shift_out[55:48] = sbox_out[23:16];
    assign shift_out[63:56] = sbox_out[63:56];
    assign shift_out[71:64] = sbox_out[103:96];
    assign shift_out[79:72] = sbox_out[15:8];
    assign shift_out[87:80] = sbox_out[55:48];
    assign shift_out[95:88] = sbox_out[95:88];
    assign shift_out[103:96] = sbox_out[7:0];
    assign shift_out[111:104] = sbox_out[47:40];
    assign shift_out[119:112] = sbox_out[87:80];
    assign shift_out[127:120] = sbox_out[127:120];
 
    assign dout = shift_out ^ round_key;
endmodule