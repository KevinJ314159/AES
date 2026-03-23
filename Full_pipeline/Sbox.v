module sbox(
    input [7:0] s_in,
    output [7:0] s_out
);
reg [7:0] sbox[0:255];
initial begin
    sbox[000]=8'h63; sbox[001]=8'h7c; sbox[002]=8'h77; sbox[003]=8'h7b; sbox[004]=8'hf2; sbox[005]=8'h6b; sbox[006]=8'h6f; sbox[007]=8'hc5;
    sbox[008]=8'h30; sbox[009]=8'h01; sbox[010]=8'h67; sbox[011]=8'h2b; sbox[012]=8'hfe; sbox[013]=8'hd7; sbox[014]=8'hab; sbox[015]=8'h76;
    sbox[016]=8'hca; sbox[017]=8'h82; sbox[018]=8'hc9; sbox[019]=8'h7d; sbox[020]=8'hfa; sbox[021]=8'h59; sbox[022]=8'h47; sbox[023]=8'hf0;
    sbox[024]=8'had; sbox[025]=8'hd4; sbox[026]=8'ha2; sbox[027]=8'haf; sbox[028]=8'h9c; sbox[029]=8'ha4; sbox[030]=8'h72; sbox[031]=8'hc0;
    sbox[032]=8'hb7; sbox[033]=8'hfd; sbox[034]=8'h93; sbox[035]=8'h26; sbox[036]=8'h36; sbox[037]=8'h3f; sbox[038]=8'hf7; sbox[039]=8'hcc;
    sbox[040]=8'h34; sbox[041]=8'ha5; sbox[042]=8'he5; sbox[043]=8'hf1; sbox[044]=8'h71; sbox[045]=8'hd8; sbox[046]=8'h31; sbox[047]=8'h15;
    sbox[048]=8'h04; sbox[049]=8'hc7; sbox[050]=8'h23; sbox[051]=8'hc3; sbox[052]=8'h18; sbox[053]=8'h96; sbox[054]=8'h05; sbox[055]=8'h9a;
    sbox[056]=8'h07; sbox[057]=8'h12; sbox[058]=8'h80; sbox[059]=8'he2; sbox[060]=8'heb; sbox[061]=8'h27; sbox[062]=8'hb2; sbox[063]=8'h75;
    sbox[064]=8'h09; sbox[065]=8'h83; sbox[066]=8'h2c; sbox[067]=8'h1a; sbox[068]=8'h1b; sbox[069]=8'h6e; sbox[070]=8'h5a; sbox[071]=8'ha0;
    sbox[072]=8'h52; sbox[073]=8'h3b; sbox[074]=8'hd6; sbox[075]=8'hb3; sbox[076]=8'h29; sbox[077]=8'he3; sbox[078]=8'h2f; sbox[079]=8'h84;
    sbox[080]=8'h53; sbox[081]=8'hd1; sbox[082]=8'h00; sbox[083]=8'hed; sbox[084]=8'h20; sbox[085]=8'hfc; sbox[086]=8'hb1; sbox[087]=8'h5b;
    sbox[088]=8'h6a; sbox[089]=8'hcb; sbox[090]=8'hbe; sbox[091]=8'h39; sbox[092]=8'h4a; sbox[093]=8'h4c; sbox[094]=8'h58; sbox[095]=8'hcf;
    sbox[096]=8'hd0; sbox[097]=8'hef; sbox[098]=8'haa; sbox[099]=8'hfb; sbox[100]=8'h43; sbox[101]=8'h4d; sbox[102]=8'h33; sbox[103]=8'h85;
    sbox[104]=8'h45; sbox[105]=8'hf9; sbox[106]=8'h02; sbox[107]=8'h7f; sbox[108]=8'h50; sbox[109]=8'h3c; sbox[110]=8'h9f; sbox[111]=8'ha8;
    sbox[112]=8'h51; sbox[113]=8'ha3; sbox[114]=8'h40; sbox[115]=8'h8f; sbox[116]=8'h92; sbox[117]=8'h9d; sbox[118]=8'h38; sbox[119]=8'hf5;
    sbox[120]=8'hbc; sbox[121]=8'hb6; sbox[122]=8'hda; sbox[123]=8'h21; sbox[124]=8'h10; sbox[125]=8'hff; sbox[126]=8'hf3; sbox[127]=8'hd2;
    sbox[128]=8'hcd; sbox[129]=8'h0c; sbox[130]=8'h13; sbox[131]=8'hec; sbox[132]=8'h5f; sbox[133]=8'h97; sbox[134]=8'h44; sbox[135]=8'h17;
    sbox[136]=8'hc4; sbox[137]=8'ha7; sbox[138]=8'h7e; sbox[139]=8'h3d; sbox[140]=8'h64; sbox[141]=8'h5d; sbox[142]=8'h19; sbox[143]=8'h73;
    sbox[144]=8'h60; sbox[145]=8'h81; sbox[146]=8'h4f; sbox[147]=8'hdc; sbox[148]=8'h22; sbox[149]=8'h2a; sbox[150]=8'h90; sbox[151]=8'h88;
    sbox[152]=8'h46; sbox[153]=8'hee; sbox[154]=8'hb8; sbox[155]=8'h14; sbox[156]=8'hde; sbox[157]=8'h5e; sbox[158]=8'h0b; sbox[159]=8'hdb;
    sbox[160]=8'he0; sbox[161]=8'h32; sbox[162]=8'h3a; sbox[163]=8'h0a; sbox[164]=8'h49; sbox[165]=8'h06; sbox[166]=8'h24; sbox[167]=8'h5c;
    sbox[168]=8'hc2; sbox[169]=8'hd3; sbox[170]=8'hac; sbox[171]=8'h62; sbox[172]=8'h91; sbox[173]=8'h95; sbox[174]=8'he4; sbox[175]=8'h79;
    sbox[176]=8'he7; sbox[177]=8'hc8; sbox[178]=8'h37; sbox[179]=8'h6d; sbox[180]=8'h8d; sbox[181]=8'hd5; sbox[182]=8'h4e; sbox[183]=8'ha9;
    sbox[184]=8'h6c; sbox[185]=8'h56; sbox[186]=8'hf4; sbox[187]=8'hea; sbox[188]=8'h65; sbox[189]=8'h7a; sbox[190]=8'hae; sbox[191]=8'h08;
    sbox[192]=8'hba; sbox[193]=8'h78; sbox[194]=8'h25; sbox[195]=8'h2e; sbox[196]=8'h1c; sbox[197]=8'ha6; sbox[198]=8'hb4; sbox[199]=8'hc6;
    sbox[200]=8'he8; sbox[201]=8'hdd; sbox[202]=8'h74; sbox[203]=8'h1f; sbox[204]=8'h4b; sbox[205]=8'hbd; sbox[206]=8'h8b; sbox[207]=8'h8a;
    sbox[208]=8'h70; sbox[209]=8'h3e; sbox[210]=8'hb5; sbox[211]=8'h66; sbox[212]=8'h48; sbox[213]=8'h03; sbox[214]=8'hf6; sbox[215]=8'h0e;
    sbox[216]=8'h61; sbox[217]=8'h35; sbox[218]=8'h57; sbox[219]=8'hb9; sbox[220]=8'h86; sbox[221]=8'hc1; sbox[222]=8'h1d; sbox[223]=8'h9e;
    sbox[224]=8'he1; sbox[225]=8'hf8; sbox[226]=8'h98; sbox[227]=8'h11; sbox[228]=8'h69; sbox[229]=8'hd9; sbox[230]=8'h8e; sbox[231]=8'h94;
    sbox[232]=8'h9b; sbox[233]=8'h1e; sbox[234]=8'h87; sbox[235]=8'he9; sbox[236]=8'hce; sbox[237]=8'h55; sbox[238]=8'h28; sbox[239]=8'hdf;
    sbox[240]=8'h8c; sbox[241]=8'ha1; sbox[242]=8'h89; sbox[243]=8'h0d; sbox[244]=8'hbf; sbox[245]=8'he6; sbox[246]=8'h42; sbox[247]=8'h68;
    sbox[248]=8'h41; sbox[249]=8'h99; sbox[250]=8'h2d; sbox[251]=8'h0f; sbox[252]=8'hb0; sbox[253]=8'h54; sbox[254]=8'hbb; sbox[255]=8'h16;
end
 
assign s_out=sbox[s_in];
 
endmodule