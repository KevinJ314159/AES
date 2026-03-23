

compile_ultra -incremental

#if {$fix_hold_switch == "true"} {
#    set_fix_hold [get_clocks *]
#    compile -incremental -only_hold_time
#}

#****************************************************
#  Output Reports
#****************************************************

report_design -nosplit >  ${reportsDir}/${TOP_MODULE}.design.txt
report_port -nosplit >  ${reportsDir}/${TOP_MODULE}.port.txt
report_net -nosplit >  ${reportsDir}/${TOP_MODULE}.net.txt
report_timing_requirements -nosplit >  ${reportsDir}/${TOP_MODULE}.timing_requirements.txt
report_constraint -nosplit -all_violators >  ${reportsDir}/${TOP_MODULE}.constraint.txt
# -delay max :setup , -delay min : hold time
report_timing -nosplit >  ${reportsDir}/${TOP_MODULE}.timing.txt
report_area -nosplit >  ${reportsDir}/${TOP_MODULE}.area.txt
report_power -nosplit > ${reportsDir}/${TOP_MODULE}.power.txt
report_timing -to [all_registers -data_pins] > ${reportsDir}/${TOP_MODULE}.timing.regist,txt
report_timing -to [all_outputs]  > ${reportsDir}/${TOP_MODULE}.timing.all_out.txt
report_reference -hierarchy -nosplit \
    > ${reportsDir}/${TOP_MODULE}.cell_usage.txt
