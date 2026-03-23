#!/bin/csh -f

cd /home/host/DFT_Project/AES_full_piplined/Full_pipeline

#This ENV is used to avoid overriding current script in next vcselab run 
setenv SNPS_VCSELAB_SCRIPT_NO_OVERRIDE  1

/usr/Synopsys/vcs/T-2022.06/linux64/bin/vcselab $* \
    -o \
    simv \
    -nobanner \

cd -

