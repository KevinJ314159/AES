debImport "-2001" "-f" "vcs.args"
debLoadSimResult /home/ICer/AES_ASIC/aes_ASIC/rtl_sim/wb_tb.fsdb
wvCreateWindow
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/A1825"
wvGetSignalSetScope -win $_nWave2 "/wb_tb"
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/wb_tb/d0\[31:0\]} \
{/wb_tb/d1\[31:0\]} \
{/wb_tb/d2\[31:0\]} \
{/wb_tb/d3\[31:0\]} \
{/wb_tb/status\[31:0\]} \
{/wb_tb/wb_ack} \
{/wb_tb/wb_adr\[31:0\]} \
{/wb_tb/wb_clk} \
{/wb_tb/wb_cyc} \
{/wb_tb/wb_dat_from_aes\[31:0\]} \
{/wb_tb/wb_dat_to_aes\[31:0\]} \
{/wb_tb/wb_rst} \
{/wb_tb/wb_sel\[3:0\]} \
{/wb_tb/wb_stb} \
{/wb_tb/wb_we} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 )} 
wvSetPosition -win $_nWave2 {("G1" 15)}
wvGetSignalClose -win $_nWave2
verdiDockWidgetMaximize -dock windowDock_nWave_2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
debExit
