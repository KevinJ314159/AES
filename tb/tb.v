`timescale 1ns/1ps
 
module aes_top_tb;
    reg clk=0;
    reg rst_n=0;
    
    reg [127:0] mkey=0;
    reg load_mkey=0;
 
    reg [127:0] plaintext=0;
    reg din_valid=0;
 
    wire [127:0] ciphertext;
    wire dout_valid;
    wire busy;
 
    aes_top uut (
        .clk(clk),
        .rst_n(rst_n),
        .mkey(mkey),
        .load_mkey(load_mkey),
        .plaintext(plaintext),
        .din_valid(din_valid),
        .ciphertext(ciphertext),
        .dout_valid(dout_valid),
        .busy(busy)
    );
 
    always #5 clk = ~clk;
 
    reg [127:0] test_plaintexts [0:9];
    reg [127:0] expected_ciphertexts [0:9];
 
    initial begin
        test_plaintexts[0]=128'h00112233445566778899aabbccddeeff;
        test_plaintexts[1]=128'h74c78ff3d66dbf57133ad70f3783632e;
        test_plaintexts[2]=128'h274c7ca8660c45692ae89ad0ccb181ba;
        test_plaintexts[3]=128'h6d996b1ee433d25ec82ae8e525853ef7;
        test_plaintexts[4]=128'h53330c09f3b978bfb6f124ef34329292;
        test_plaintexts[5]=128'h720f5ec1eafcb180549b5dd35aaa4311;
        test_plaintexts[6]=128'hf7cfe13517d5a56ee8390ab607bb1025;
        test_plaintexts[7]=128'h7074fa1315798698fee73b1beb30ab55;
        test_plaintexts[8]=128'h5e6030ea185d0ea90e1a81a84b2f5651;
        test_plaintexts[9]=128'h944375ea4102920901f920a09a86efa7;
 
        expected_ciphertexts[0]=128'h69c4e0d86a7b0430d8cdb78070b4c55a;
        expected_ciphertexts[1]=128'heb7db34352d001fe483bddb27e9349a1;
        expected_ciphertexts[2]=128'h67d455bea9e118bd8425eaf27bc08933;
        expected_ciphertexts[3]=128'h5fe2c1898df6a83b9b061c589357f587;
        expected_ciphertexts[4]=128'h965c2dba77ff86a316199702c7c36728;
        expected_ciphertexts[5]=128'h5edcf52367a8f289ff6fc2a41d2752a9;
        expected_ciphertexts[6]=128'h22f0eaf54a178cf157514dcf83673862;
        expected_ciphertexts[7]=128'h6a1ce927be8ea92bcf185f4370c29087;
        expected_ciphertexts[8]=128'h2f1043780796ac3b4332e5e09460f327;
        expected_ciphertexts[9]=128'h4a5a4421892df67cd9b8af80c0b8f3b6;
    end
 
    integer i = 0;
 
    initial begin
        #15 rst_n = 1;
        mkey = 128'h000102030405060708090a0b0c0d0e0f;
        load_mkey = 1;
        @(negedge clk);
        load_mkey = 0;
 
        wait(busy == 0);
        @(negedge clk);
        #20 plaintext=test_plaintexts[0]; din_valid = 1;
        #10 din_valid = 0;
 
        #20 plaintext = test_plaintexts[1]; din_valid = 1;
        #10 plaintext = test_plaintexts[2];
        #10 plaintext = test_plaintexts[3];
        #10 plaintext = test_plaintexts[4];
        #10 din_valid = 0;
 
        #30 plaintext = test_plaintexts[5]; din_valid = 1;
        #10 plaintext = test_plaintexts[6];
        #10 plaintext = test_plaintexts[7];
        #10 plaintext = test_plaintexts[8];
        #10 plaintext = test_plaintexts[9];
        #10 din_valid = 0;
 
        wait(busy == 0);
        #100 $finish;
    end
 
    always @(posedge clk) begin
        if (dout_valid) begin
            if (ciphertext === expected_ciphertexts[i]) begin
                $display("Test %0d: Passed, Expected %h, Actual %h", i, expected_ciphertexts[i], ciphertext);
            end else begin
                $display("Test %0d: Failed, Expected %h, Actual %h", i, expected_ciphertexts[i], ciphertext);
            end
            i = i + 1;
        end
    end
 /*
    initial begin
        $dumpfile("aes_top.vcd");
        $dumpvars(0, aes_top_tb);
    end
*/

	initial begin
    	 $fsdbDumpfile("tb.fsdb");
    	 $fsdbDumpvars(0, aes_top_tb); // tb_MatrixMultiplier 是顶层模块名> 
	end
endmodule
