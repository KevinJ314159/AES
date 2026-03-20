

module aes_ASIC(
        // WISHBONE Interface
        PAD_wb_clk_i, PAD_wb_rst_i, PAD_wb_cyc_i, PAD_wb_adr_i, PAD_wb_dat_i, PAD_wb_sel_i,
        PAD_wb_we_i, PAD_wb_stb_i,PAD_wb_dat_o, PAD_wb_ack_o

    );
    //
    // WISHBONE Interface
    //
    input             PAD_wb_clk_i;	// Clock
    input             PAD_wb_rst_i;	// Reset
    input             PAD_wb_cyc_i;	// cycle valid input
    input   [5:0]     PAD_wb_adr_i;	// address bus inputs
    input   [31:0]    PAD_wb_dat_i;	// input data bus
    input   [3:0]     PAD_wb_sel_i;	// byte select inputs
    input             PAD_wb_we_i;	// indicates write transfer
    input             PAD_wb_stb_i;	// strobe input
    output  [31:0]    PAD_wb_dat_o;	// output data bus
    output            PAD_wb_ack_o;	// normal termination


    wire              wb_clk_i;	// Clock
    wire              wb_rst_i;	// Reset
    wire              wb_cyc_i;	// cycle valid input
    wire    [5:0]     wb_adr_i;	// address bus inputs
    wire    [31:0]    wb_dat_i;	// input data bus
    wire    [3:0]     wb_sel_i;	// byte select inputs
    wire              wb_we_i;	// indicates write transfer
    wire              wb_stb_i;	// strobe input
    wire    [31:0]    wb_dat_o;	// output data bus
    wire              wb_ack_o;	// normal termination


//PAD

I1025_EW  wb_clk_i_0 ( .PADIO(PAD_wb_clk_i), .R_EN(1'b1), .DOUT(wb_clk_i));

I1025_EW  wb_cyc_i_0 ( .PADIO(PAD_wb_cyc_i), .R_EN(1'b1), .DOUT(wb_cyc_i));
I1025_EW  wb_rst_i_0 ( .PADIO(PAD_wb_rst_i), .R_EN(1'b1), .DOUT(wb_rst_i));
I1025_EW  wb_adr_i_0 ( .PADIO(PAD_wb_adr_i[0]), .R_EN(1'b1), .DOUT(wb_adr_i[0]));
I1025_EW  wb_adr_i_1 ( .PADIO(PAD_wb_adr_i[1]), .R_EN(1'b1), .DOUT(wb_adr_i[1]));
I1025_EW  wb_adr_i_2 ( .PADIO(PAD_wb_adr_i[2]), .R_EN(1'b1), .DOUT(wb_adr_i[2 ]));
I1025_EW  wb_adr_i_3 ( .PADIO(PAD_wb_adr_i[3 ]), .R_EN(1'b1), .DOUT(wb_adr_i[3 ]));
I1025_EW  wb_adr_i_4 ( .PADIO(PAD_wb_adr_i[4 ]), .R_EN(1'b1), .DOUT(wb_adr_i[4 ]));
I1025_EW  wb_adr_i_5 ( .PADIO(PAD_wb_adr_i[5]), .R_EN(1'b1), .DOUT(wb_adr_i[5]));


I1025_EW  wb_dat_i_0 ( .PADIO(PAD_wb_dat_i[0]), .R_EN(1'b1), .DOUT(wb_dat_i[0]));
I1025_EW  wb_dat_i_1 ( .PADIO(PAD_wb_dat_i[1]), .R_EN(1'b1), .DOUT(wb_dat_i[1]));
I1025_EW  wb_dat_i_2 ( .PADIO(PAD_wb_dat_i[2]), .R_EN(1'b1), .DOUT(wb_dat_i[2 ]));
I1025_EW  wb_dat_i_3 ( .PADIO(PAD_wb_dat_i[3 ]), .R_EN(1'b1), .DOUT(wb_dat_i[3 ]));
I1025_EW  wb_dat_i_4 ( .PADIO(PAD_wb_dat_i[4 ]), .R_EN(1'b1), .DOUT(wb_dat_i[4 ]));
I1025_EW  wb_dat_i_5 ( .PADIO(PAD_wb_dat_i[5]), .R_EN(1'b1), .DOUT(wb_dat_i[5]));
I1025_EW  wb_dat_i_6 ( .PADIO(PAD_wb_dat_i[6]), .R_EN(1'b1), .DOUT(wb_dat_i[6]));
I1025_EW  wb_dat_i_7 ( .PADIO(PAD_wb_dat_i[7]), .R_EN(1'b1), .DOUT(wb_dat_i[7]));
I1025_EW  wb_dat_i_8 ( .PADIO(PAD_wb_dat_i[8]), .R_EN(1'b1), .DOUT(wb_dat_i[8]));
I1025_EW  wb_dat_i_9 ( .PADIO(PAD_wb_dat_i[9]), .R_EN(1'b1), .DOUT(wb_dat_i[9]));
I1025_EW  wb_dat_i_10 ( .PADIO(PAD_wb_dat_i[10]), .R_EN(1'b1), .DOUT(wb_dat_i[10]));
I1025_EW  wb_dat_i_11 ( .PADIO(PAD_wb_dat_i[11]), .R_EN(1'b1), .DOUT(wb_dat_i[11]));
I1025_EW  wb_dat_i_12 ( .PADIO(PAD_wb_dat_i[12]), .R_EN(1'b1), .DOUT(wb_dat_i[12 ]));
I1025_EW  wb_dat_i_13 ( .PADIO(PAD_wb_dat_i[13]), .R_EN(1'b1), .DOUT(wb_dat_i[13]));
I1025_EW  wb_dat_i_14 ( .PADIO(PAD_wb_dat_i[14]), .R_EN(1'b1), .DOUT(wb_dat_i[14]));
I1025_EW  wb_dat_i_15 ( .PADIO(PAD_wb_dat_i[15]), .R_EN(1'b1), .DOUT(wb_dat_i[15]));
I1025_EW  wb_dat_i_16 ( .PADIO(PAD_wb_dat_i[16]), .R_EN(1'b1), .DOUT(wb_dat_i[16]));
I1025_EW  wb_dat_i_17 ( .PADIO(PAD_wb_dat_i[17]), .R_EN(1'b1), .DOUT(wb_dat_i[17]));
I1025_EW  wb_dat_i_18 ( .PADIO(PAD_wb_dat_i[18]), .R_EN(1'b1), .DOUT(wb_dat_i[18]));
I1025_EW  wb_dat_i_19 ( .PADIO(PAD_wb_dat_i[19]), .R_EN(1'b1), .DOUT(wb_dat_i[19]));
I1025_EW  wb_dat_i_20 ( .PADIO(PAD_wb_dat_i[20]), .R_EN(1'b1), .DOUT(wb_dat_i[20]));
I1025_EW  wb_dat_i_21 ( .PADIO(PAD_wb_dat_i[21]), .R_EN(1'b1), .DOUT(wb_dat_i[21]));
I1025_EW  wb_dat_i_22 ( .PADIO(PAD_wb_dat_i[22]), .R_EN(1'b1), .DOUT(wb_dat_i[22]));
I1025_EW  wb_dat_i_23 ( .PADIO(PAD_wb_dat_i[23]), .R_EN(1'b1), .DOUT(wb_dat_i[23]));
I1025_EW  wb_dat_i_24 ( .PADIO(PAD_wb_dat_i[24]), .R_EN(1'b1), .DOUT(wb_dat_i[24]));
I1025_EW  wb_dat_i_25 ( .PADIO(PAD_wb_dat_i[25]), .R_EN(1'b1), .DOUT(wb_dat_i[25]));
I1025_EW  wb_dat_i_26 ( .PADIO(PAD_wb_dat_i[26]), .R_EN(1'b1), .DOUT(wb_dat_i[26]));
I1025_EW  wb_dat_i_27 ( .PADIO(PAD_wb_dat_i[27]), .R_EN(1'b1), .DOUT(wb_dat_i[27]));
I1025_EW  wb_dat_i_28 ( .PADIO(PAD_wb_dat_i[28]), .R_EN(1'b1), .DOUT(wb_dat_i[28]));
I1025_EW  wb_dat_i_29 ( .PADIO(PAD_wb_dat_i[29]), .R_EN(1'b1), .DOUT(wb_dat_i[29]));
I1025_EW  wb_dat_i_30 ( .PADIO(PAD_wb_dat_i[30]), .R_EN(1'b1), .DOUT(wb_dat_i[30]));
I1025_EW  wb_dat_i_31 ( .PADIO(PAD_wb_dat_i[31]), .R_EN(1'b1), .DOUT(wb_dat_i[31]));


I1025_EW  wb_sel_i_0 ( .PADIO(PAD_wb_sel_i[0]), .R_EN(1'b1), .DOUT(wb_sel_i[0]));
I1025_EW  wb_sel_i_1 ( .PADIO(PAD_wb_sel_i[1]), .R_EN(1'b1), .DOUT(wb_sel_i[1]));
I1025_EW  wb_sel_i_2 ( .PADIO(PAD_wb_sel_i[2]), .R_EN(1'b1), .DOUT(wb_sel_i[2]));
I1025_EW  wb_sel_i_3 ( .PADIO(PAD_wb_sel_i[3]), .R_EN(1'b1), .DOUT(wb_sel_i[3]));


I1025_EW  wb_we_i_0 ( .PADIO(PAD_wb_we_i), .R_EN(1'b1), .DOUT(wb_we_i));
I1025_EW  wb_stb_i_0 ( .PADIO(PAD_wb_stb_i), .R_EN(1'b1), .DOUT(wb_stb_i));

D12I1025_NS    wb_dat_o_0 ( .DIN(wb_dat_o[0]), .EN(1'b1), .PADIO(PAD_wb_dat_o[0]));
D12I1025_NS    wb_dat_o_1 ( .DIN(wb_dat_o[1]), .EN(1'b1), .PADIO(PAD_wb_dat_o[1]));
D12I1025_NS    wb_dat_o_2 ( .DIN(wb_dat_o[2]), .EN(1'b1), .PADIO(PAD_wb_dat_o[2 ]));
D12I1025_NS    wb_dat_o_3 ( .DIN(wb_dat_o[3]), .EN(1'b1), .PADIO(PAD_wb_dat_o[3]));
D12I1025_NS    wb_dat_o_4 ( .DIN(wb_dat_o[4]), .EN(1'b1), .PADIO(PAD_wb_dat_o[4]));
D12I1025_NS    wb_dat_o_5 ( .DIN(wb_dat_o[5]), .EN(1'b1), .PADIO(PAD_wb_dat_o[5]));
D12I1025_NS    wb_dat_o_6 ( .DIN(wb_dat_o[6]), .EN(1'b1), .PADIO(PAD_wb_dat_o[6]));
D12I1025_NS    wb_dat_o_7 ( .DIN(wb_dat_o[7]), .EN(1'b1), .PADIO(PAD_wb_dat_o[7]));
D12I1025_NS    wb_dat_o_8 ( .DIN(wb_dat_o[8]), .EN(1'b1), .PADIO(PAD_wb_dat_o[8]));
D12I1025_NS    wb_dat_o_9 ( .DIN(wb_dat_o[9]), .EN(1'b1), .PADIO(PAD_wb_dat_o[9]));
D12I1025_NS    wb_dat_o_10 ( .DIN(wb_dat_o[10]), .EN(1'b1), .PADIO(PAD_wb_dat_o[10]));
D12I1025_NS    wb_dat_o_11 ( .DIN(wb_dat_o[11]), .EN(1'b1), .PADIO(PAD_wb_dat_o[11]));
D12I1025_NS    wb_dat_o_12 ( .DIN(wb_dat_o[12]), .EN(1'b1), .PADIO(PAD_wb_dat_o[12]));
D12I1025_NS    wb_dat_o_13 ( .DIN(wb_dat_o[13]), .EN(1'b1), .PADIO(PAD_wb_dat_o[13]));
D12I1025_NS    wb_dat_o_14 ( .DIN(wb_dat_o[14]), .EN(1'b1), .PADIO(PAD_wb_dat_o[14]));
D12I1025_NS    wb_dat_o_15 ( .DIN(wb_dat_o[15]), .EN(1'b1), .PADIO(PAD_wb_dat_o[15]));
D12I1025_NS    wb_dat_o_16 ( .DIN(wb_dat_o[16]), .EN(1'b1), .PADIO(PAD_wb_dat_o[16]));
D12I1025_NS    wb_dat_o_17 ( .DIN(wb_dat_o[17]), .EN(1'b1), .PADIO(PAD_wb_dat_o[17]));
D12I1025_NS    wb_dat_o_18 ( .DIN(wb_dat_o[18]), .EN(1'b1), .PADIO(PAD_wb_dat_o[18]));
D12I1025_NS    wb_dat_o_19 ( .DIN(wb_dat_o[19]), .EN(1'b1), .PADIO(PAD_wb_dat_o[19]));
D12I1025_NS    wb_dat_o_20 ( .DIN(wb_dat_o[20]), .EN(1'b1), .PADIO(PAD_wb_dat_o[20]));
D12I1025_NS    wb_dat_o_21 ( .DIN(wb_dat_o[21]), .EN(1'b1), .PADIO(PAD_wb_dat_o[21]));
D12I1025_NS    wb_dat_o_22 ( .DIN(wb_dat_o[22]), .EN(1'b1), .PADIO(PAD_wb_dat_o[22]));
D12I1025_NS    wb_dat_o_23 ( .DIN(wb_dat_o[23]), .EN(1'b1), .PADIO(PAD_wb_dat_o[23]));
D12I1025_NS    wb_dat_o_24 ( .DIN(wb_dat_o[24]), .EN(1'b1), .PADIO(PAD_wb_dat_o[24]));
D12I1025_NS    wb_dat_o_25 ( .DIN(wb_dat_o[25]), .EN(1'b1), .PADIO(PAD_wb_dat_o[25]));
D12I1025_NS    wb_dat_o_26 ( .DIN(wb_dat_o[26]), .EN(1'b1), .PADIO(PAD_wb_dat_o[26]));
D12I1025_NS    wb_dat_o_27 ( .DIN(wb_dat_o[27]), .EN(1'b1), .PADIO(PAD_wb_dat_o[27]));
D12I1025_NS    wb_dat_o_28 ( .DIN(wb_dat_o[28]), .EN(1'b1), .PADIO(PAD_wb_dat_o[28]));
D12I1025_NS    wb_dat_o_29 ( .DIN(wb_dat_o[29]), .EN(1'b1), .PADIO(PAD_wb_dat_o[29]));
D12I1025_NS    wb_dat_o_30 ( .DIN(wb_dat_o[30]), .EN(1'b1), .PADIO(PAD_wb_dat_o[30]));
D12I1025_NS    wb_dat_o_31 ( .DIN(wb_dat_o[31]), .EN(1'b1), .PADIO(PAD_wb_dat_o[31]));


D12I1025_NS    wb_ack_o_0 ( .DIN(wb_ack_o), .EN(1'b1), .PADIO(PAD_wb_ack_o) );
//inst
aes_top aes_top_inst(
        // WISHBONE Interface
        .wb_clk_i(wb_clk_i),
	.wb_rst_i(wb_rst_i), 
	.wb_cyc_i(wb_cyc_i), 
	.wb_adr_i(wb_adr_i), 
	.wb_dat_i(wb_dat_i), 
	.wb_sel_i(wb_sel_i),
        .wb_we_i(wb_we_i), 
	.wb_stb_i(wb_stb_i),
	.wb_dat_o(wb_dat_o), 
	.wb_ack_o(wb_ack_o)

    );


endmodule
