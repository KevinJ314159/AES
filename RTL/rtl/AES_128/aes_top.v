//dxzhang@ustc.edu, 20101011


module aes_top(
        // WISHBONE Interface
        wb_clk_i, wb_rst_i, wb_cyc_i, wb_adr_i, wb_dat_i, wb_sel_i,
        wb_we_i, wb_stb_i,wb_dat_o, wb_ack_o

    );
    //
    // WISHBONE Interface
    //
    input             wb_clk_i;	// Clock
    input             wb_rst_i;	// Reset
    input             wb_cyc_i;	// cycle valid input
    input   [5:0]     wb_adr_i;	// address bus inputs
    input   [31:0]    wb_dat_i;	// input data bus
    input   [3:0]     wb_sel_i;	// byte select inputs
    input             wb_we_i;	// indicates write transfer
    input             wb_stb_i;	// strobe input
    output  [31:0]    wb_dat_o;	// output data bus
    output            wb_ack_o;	// normal termination

    reg     [31:0]    wb_dat_o;
    reg wb_ack_o;

    reg	[127:0]	key;
    reg	[127:0]	text_in;
    wire	[127:0]	text_out_tmp;
    reg	[127:0]	text_out;
    reg done_r;
    wire done;

    wire wb_write;
    wire wb_read;
    assign wb_write = wb_cyc_i & wb_stb_i & wb_we_i;
    assign wb_read = wb_cyc_i & wb_stb_i & (!wb_we_i);



    always@(posedge wb_clk_i)
    begin
	if(wb_rst_i)
		wb_ack_o <= 1'b0;
	else
		wb_ack_o <= wb_cyc_i & wb_stb_i;
    end



    always@(posedge wb_clk_i)
    begin
        if(wb_write) begin
            case(wb_adr_i[5:2])
                4'h0: begin   //key[0]
			key[31:0] <= wb_dat_i;
                end
                4'h1: begin   //key[1]
			key[63:32] <= wb_dat_i;
                end
                4'h2: begin   //key[2]
			key[95:64] <= wb_dat_i;
                end
                4'h3: begin   //key[3]
			key[127:96] <= wb_dat_i;
		end

                4'h4: begin   //text_in[0]
			text_in[31:0] <= wb_dat_i;
                end
                4'h5: begin   //text_in[1]
			text_in[63:32] <= wb_dat_i;
                end
                4'h6: begin   //text_in[2]
			text_in[95:64] <= wb_dat_i;
                end
                4'h7: begin   //text_in[3]
			text_in[127:96] <= wb_dat_i;
		end

		//4'hc: ld signal
		
            endcase
        end
        else if(wb_read) begin
            case(wb_adr_i[5:2])
                4'h0: begin  //key[0]
			wb_dat_o <= key[31:0];
                end
                4'h1: begin   //key[1]
			wb_dat_o <= key[63:32];
                end
                4'h2: begin   //key[2]
			wb_dat_o <= key[95:64];
                end
                4'h3: begin   //key[3]
			wb_dat_o <= key[127:96];
                end

                4'h4: begin   //text_in[0]
			wb_dat_o <= text_in[31:0];
                end
                4'h5: begin   //text_in[1]
			wb_dat_o <= text_in[63:32];
                end
                4'h6: begin   //text_in[2]
			wb_dat_o <= text_in[95:64];
                end
                4'h7: begin   //text_in[3]
			wb_dat_o <= text_in[127:96];
                end

                4'h8: begin   //text_out[0]
			wb_dat_o <= text_out[31:0];
                end
                4'h9: begin   //text_out[1]
			wb_dat_o <= text_out[63:32];
                end
                4'ha: begin   //text_out[2]
			wb_dat_o <= text_out[95:64];
                end
                4'hb: begin   //text_out[3]
			wb_dat_o <= text_out[127:96];
                end

		//4'hc: ld signal


                4'hd: begin   //done
			wb_dat_o <= {31'h0,done_r};
                end
		default: begin
			wb_dat_o <= 32'h0;
		end
            endcase
        end
    end


// ld signal
    wire ld;
    assign ld = wb_stb_i & wb_cyc_i & (wb_adr_i[5:2]==4'hc) & wb_we_i;
    
//done_r signal
    always@(posedge wb_clk_i)
    begin
	if(wb_rst_i) begin
		done_r <= 1'b0;
	end
	else 	begin
		if(done) begin
			done_r <= 1'b1;
		end
	 	else	begin
			if(ld) begin
				done_r <= 1'b0;
			end
		end
	end
		
    end
//text_out signal
    always@(posedge wb_clk_i)
    begin
	if(wb_rst_i) begin
		text_out <= 128'h0;
	end
	else 	begin
		if(done) begin
			text_out <= text_out_tmp;
		end
	end
    end

//module aes_cipher_top(clk, rst, ld, done, key, text_in, text_out );
aes_cipher_top  aes_cipher_inst(
			.clk(wb_clk_i), 
			.rst(wb_rst_i), 
			.ld(ld), 
			.done(done), 
			.key(key), 
			.text_in(text_in), 
			.text_out(text_out_tmp) 
			);

endmodule
