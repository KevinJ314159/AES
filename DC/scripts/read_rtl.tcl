#***************************************************
date
#****************************************************

set exit_switch 	[getenv exit_switch]

set TOP_MODULE aes_ASIC_new
set_svf ${svfDir}/${TOP_MODULE}.svf

puts "PWD = [pwd]"

set FLISTDIR "$TOPDIR/../filelist" 

define_design_lib WORK -path WORK

analyze -format verilog -lib WORK [sh cat $FLISTDIR/rtl.f]

elaborate $TOP_MODULE

current_design $TOP_MODULE	
link
if { [link] == 0 } {
	echo "Linking Error when deal with $TOP_MODULE"
	exit;
}
uniquify
if { [check_design] == 0 } {
	echo "Check Design Error when deal with $TOP_MODULE"
	exit;
}

write -format ddc -hierarchy -output ${netlistDir}/${TOP_MODULE}_unmapped.ddc

date

#****************************************************
#  Finish and Quit
#****************************************************
if {$exit_switch == "true"} {
exit
}
