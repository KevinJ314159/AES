#!/bin/csh -f

# 工程根目录
set ROOT = /home/host/DFT_Project/AES_full_piplined

# 输出目录
set OUT  = $ROOT/sim

# 创建目录（如果不存在）
if (! -d $OUT) then
    mkdir -p $OUT
endif

# 切换到输出目录
cd $OUT

pwd

# flist 用绝对路径（关键）
set flist    = "$ROOT/flist.f"
set notiming = "+nospecify"

vcs -full64               \
    -debug_access+all     \
    -line                 \
    +vcsd                 \
    +vpi                  \
    +plusarg_save         \
    -Mupdate              \
    +error+10             \
    +v2k                  \
    +ntb_exit_on_error=10 \
    -timescale=1ns/100ps  \
    -negdelay             \
    +neg_tchk             \
    +memcbk               \
    +sdfverbose           \
    +warn=all             \
    +warn=noTFIPC         \
    $notiming             \
    +warn=noWSUM          \
    -l vcs.log            \
    -f $flist

exit $status
