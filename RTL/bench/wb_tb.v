`timescale 1ns/100ps
`define HALF_PERIOD 1000

module wb_tb;
reg wb_clk;
reg wb_rst;
wire wb_stb;
wire wb_cyc;
wire wb_ack;
wire [3:0] wb_sel;
wire [31:0] wb_dat_to_aes;
wire [31:0] wb_dat_from_aes;
wire [31:0] wb_adr;
wire wb_we;



/*
module aes_top(
        // WISHBONE Interface
        wb_clk_i, wb_rst_i, wb_cyc_i, wb_adr_i, wb_dat_i, wb_sel_i,
        wb_we_i, wb_stb_i,wb_dat_o, wb_ack_o

    );

*/
/*
aes_top aes_top_inst(
	.wb_clk_i(wb_clk),
	.wb_rst_i(wb_rst),
	.wb_stb_i(wb_stb),
	.wb_cyc_i(wb_cyc),
	.wb_dat_i(wb_dat_to_aes),
	.wb_dat_o(wb_dat_from_aes),
	.wb_adr_i(wb_adr[5:0]),
	.wb_we_i(wb_we),
	.wb_ack_o(wb_ack),
	.wb_sel_i(wb_sel)
);
*/

aes_ASIC aes_ASIC_inst(
	.PAD_wb_clk_i(wb_clk),
	.PAD_wb_rst_i(wb_rst),
	.PAD_wb_stb_i(wb_stb),
	.PAD_wb_cyc_i(wb_cyc),
	.PAD_wb_dat_i(wb_dat_to_aes),
	.PAD_wb_dat_o(wb_dat_from_aes),
	.PAD_wb_adr_i(wb_adr[5:0]),
	.PAD_wb_we_i(wb_we),
	.PAD_wb_ack_o(wb_ack),
	.PAD_wb_sel_i(wb_sel)
);

/*
module wb_mast(clk, rst, adr, din, dout, cyc, stb, sel, we, ack, err, rty);
*/
wb_mast wb_mast_inst(
	.clk(wb_clk),
	.rst(wb_rst),
	.adr(wb_adr),
	.din(wb_dat_from_aes),
	.dout(wb_dat_to_aes),
	.cyc(wb_cyc),
	.stb(wb_stb),
	.sel(wb_sel),
	.we(wb_we),
	.ack(wb_ack),
	.err(1'b0),
	.rty(1'b0)
);

initial begin
	wb_clk = 0 ;
end
always
begin
	#`HALF_PERIOD wb_clk <= ~wb_clk;
end


reg [31:0] status;

reg [31:0] d0,d1,d2,d3;


//tv[283]= 384'h00000000000000000000000000000000ffffffffffffffffffffffffffffffff3f5b8cc9ea855a0afa7347d23e8d664e;
//key--plain--cipher

//address: c,8,4,0-->key[3],key[2],key[1],key[0]
//1c,18,14,,10 -->text_in[3],text_in[2],text_in[1],text_in[0]
//30-->ld
//34-->done

initial begin

	wb_rst<=1;
	#50 wb_rst<=0;
//write your test here!
	@(posedge wb_clk);

	wb_mast_inst.wb_wr1(32'h0,4'b1111,32'h0);
	wb_mast_inst.wb_wr1(32'h4,4'b1111,32'h0);
	wb_mast_inst.wb_wr1(32'h8,4'b1111,32'h0);
	wb_mast_inst.wb_wr1(32'hc,4'b1111,32'h0);

	wb_mast_inst.wb_wr1(32'h10,4'b1111,32'hffffffff);
	wb_mast_inst.wb_wr1(32'h14,4'b1111,32'hffffffff);
	wb_mast_inst.wb_wr1(32'h18,4'b1111,32'hffffffff);
	wb_mast_inst.wb_wr1(32'h1c,4'b1111,32'hffffffff);

	wb_mast_inst.wb_wr1(32'h30,4'b1111,32'h1); //any value


	wb_mast_inst.wb_rd1(32'h34,4'b1111,status); 
	while(status[0] != 1'b1)
		begin
		wb_mast_inst.wb_rd1(32'h34,4'b1111,status); 
		end


	@(posedge wb_clk);
	wb_mast_inst.wb_rd1(32'h20,4'b1111,d0); 
	wb_mast_inst.wb_rd1(32'h24,4'b1111,d1); 
	wb_mast_inst.wb_rd1(32'h28,4'b1111,d2); 
	wb_mast_inst.wb_rd1(32'h2c,4'b1111,d3); 
	
	//wb_mast_inst.wb_rd4(32'h20,4'b1111,1,d0,d1,d2,d3);
	$display($time,,"read4from %x, value = %x , %x , %x , %x\n",32'h20,d3,d2,d1,d0);


	#100 $stop;
end


`ifdef	DUMP_FSDB
initial begin
	$fsdbDumpfile("wb_tb.fsdb");
	$fsdbDumpvars();
end
`endif



`ifdef  POST_APR
initial begin
              $sdf_annotate("./data_bend/aes_ASIC_post_APR.PT.sdf");
end
`endif
`ifdef POST_DC 
  initial begin 
  $sdf_annotate("./data_bend/aes_ASIC_post_dc.sdf");
end 
`endif
endmodule
