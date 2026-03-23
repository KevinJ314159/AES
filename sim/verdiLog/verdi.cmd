sidCmdLineBehaviorAnalysisOpt -incr -clockSkew 0 -loopUnroll 0 -bboxEmptyModule 0  -cellModel 0 -bboxIgnoreProtected 0 
debImport "-f" "flist.f" "-2001" "-top" "aes_top_tb"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -dock widgetDock_<Inst._Tree>
wvCreateWindow
verdiSetActWin -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/host/DFT_Project/AES_full_piplined/sim/tb.fsdb}
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcSelect -win $_nTrace1 -range {4 15 1 6 1 1} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {4 15 1 6 1 1} -backward
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
verdiSetActWin -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSetOptions -win $_nWave2 -leadingZeros on
wvSetCursor -win $_nWave2 214909.803815 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 170270.344127 -snap {("G1" 5)}
wvScrollUp -win $_nWave2 2
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 185150.164023 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 194944.475853 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 184961.811872 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 275182.492001 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 284600.099530 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 295336.172113 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 304942.131793 -snap {("G1" 7)}
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "aes_top_tb.uut" -win $_nTrace1
srcSetScope "aes_top_tb.uut" -delim "." -win $_nTrace1
srcHBSelect "aes_top_tb.uut" -win $_nTrace1
srcHBSelect "aes_top_tb.uut.u_ke" -win $_nTrace1
srcHBSelect "aes_top_tb.uut.u_ke" -win $_nTrace1
srcSetScope "aes_top_tb.uut.u_ke" -delim "." -win $_nTrace1
srcHBSelect "aes_top_tb.uut.u_ke" -win $_nTrace1
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcSelect -win $_nTrace1 -range {2 8 1 1 3 1} -backward
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
verdiSetActWin -win $_nWave2
wvScrollDown -win $_nWave2 1
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvAddGroup -win $_nWave2 {G3}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 24862.483877 -snap {("G2" 4)}
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 18646.862908 -snap {("G2" 5)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 18693.950945 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 24579.955651 -snap {("G2" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "load_mkey" -line 62 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcSelect -win $_nTrace1 -range {62 63 5 3 1 1}
srcDeselectAll -win $_nTrace1
srcSelect -signal "load_mkey" -line 62 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "round_ctrl" -line 63 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
verdiSetActWin -win $_nWave2
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetCursor -win $_nWave2 14832.731858 -snap {("G2" 3)}
verdiSetActWin -win $_nWave2
wvSetCursor -win $_nWave2 31266.456997 -snap {("G2" 5)}
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 20106.592075 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 19588.623661 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 19588.623661 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 19682.799736 -snap {("G2" 5)}
wvZoom -win $_nWave2 14879.819896 16009.932800
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 14995.867958 -snap {("G1" 8)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 21830.050405 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 28999.719277
srcDeselectAll -win $_nTrace1
srcSelect -signal "start_key_expand" -line 20 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
verdiSetActWin -win $_nWave2
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSetCursor -win $_nWave2 70895.756941
wvSetCursor -win $_nWave2 223533.263489 -snap {("G2" 1)}
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
srcHBSelect "aes_top_tb.uut" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "aes_top_tb.uut.u_en" -win $_nTrace1
srcHBSelect "aes_top_tb.uut.u_ke" -win $_nTrace1
srcHBSelect "aes_top_tb.uut.u_en" -win $_nTrace1
srcHBSelect "aes_top_tb.uut.u_en" -win $_nTrace1
srcSetScope "aes_top_tb.uut.u_en" -delim "." -win $_nTrace1
srcHBSelect "aes_top_tb.uut.u_en" -win $_nTrace1
srcHBSelect "aes_top_tb.uut" -win $_nTrace1
srcSetScope "aes_top_tb.uut" -delim "." -win $_nTrace1
srcHBSelect "aes_top_tb.uut" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "key_expand_busy" -line 16 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcAction -pos 19 1 4 -win $_nTrace1 -name "encrypt" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -inst "u_en" -line 20 -pos 1 -win $_nTrace1
srcAction -pos 19 3 1 -win $_nTrace1 -name "u_en" -ctrlKey off
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
verdiSetActWin -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 38886.851755 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 41796.752226
wvSetCursor -win $_nWave2 81212.676794 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 81212.676794 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 84122.577266 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 79889.994762 -snap {("G2" 5)}
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSetCursor -win $_nWave2 11696.890266
wvSetCursor -win $_nWave2 57155.259253
wvSetCursor -win $_nWave2 19140.365889
wvSetCursor -win $_nWave2 31103.094570
wvSetCursor -win $_nWave2 39344.085439
wvSetCursor -win $_nWave2 51838.490950
wvSetCursor -win $_nWave2 60876.997065
wvSetCursor -win $_nWave2 70713.018424
wvSetCursor -win $_nWave2 78422.332463
wvSetCursor -win $_nWave2 78422.332463
wvSetCursor -win $_nWave2 91448.414805
wvSetCursor -win $_nWave2 91448.414805
wvSetCursor -win $_nWave2 101284.436164
wvSetCursor -win $_nWave2 31634.771400
wvSetCursor -win $_nWave2 19672.042720
wvSetCursor -win $_nWave2 27381.356758
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 140096.844773 -snap {("G1" 1)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvPanRight -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "aes_top_tb.uut.u_ke" -win $_nTrace1
srcSetScope "aes_top_tb.uut.u_ke" -delim "." -win $_nTrace1
srcHBSelect "aes_top_tb.uut.u_ke" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
wvSetCursor -win $_nWave2 32166.448231 -snap {("G1" 8)}
verdiSetActWin -win $_nWave2
wvSetCursor -win $_nWave2 28976.387249 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 29508.064079 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 29508.064079
wvSetCursor -win $_nWave2 29508.064079
wvSetCursor -win $_nWave2 41736.631175 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 36951.539703 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 39078.247024 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 39609.923854 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 39078.247024 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 40141.600685 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 38812.408609 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 29773.902495 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 40673.277515 -snap {("G2" 5)}
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -line 2 -pos 1 -win $_nTrace1
verdiSetActWin -win $_nWave2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
verdiCaptureWindow -win $_nWave2
wvCapture -win $_nWave2 -file \
          "/home/host/DFT_Project/AES_full_piplined/sim/untitled.png"
