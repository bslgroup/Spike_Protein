#!/bin/bash
#This script counts the amount of water molecules within 5 Angstrom of each spike protein component specified in the macro files.
#The macros for each component for each system are uploaded to the macros folder.
#This is a sample script for a 5x5b system that you can easily modify and run for different systems/Proteins.

a=("5x5b" )


for j in `seq 0 0` # loops through 5 sub directories 
do 


cat > water.tcl << EOF

mol new /home/losey/cov_loop/5x5b/step3_charmm2namd.psf
mol addfile /home/losey/cov_loop/5x5b/step3_charmm2namd.pdb
mol addfile /home/losey/cov_loop/5x5b/5x5b_loop_eq_wrapped.dcd type dcd first 0 last -1 step 8 filebonds 1 autobonds 1 waitfor all
mol addfile /home/losey/cov_loop/5x5b/5x5b_loop_1_wrapped.dcd type dcd first 0 last -1 step 4 filebonds 1 autobonds 1 waitfor all
mol addfile /home/losey/cov_loop/5x5b/5x5b_loop_2_wrapped.dcd type dcd first 0 last -1 step 4 filebonds 1 autobonds 1 waitfor all
mol addfile /home/losey/cov_loop/5x5b/5x5b_loop_3_wrapped.dcd type dcd first 0 last -1 step 4 filebonds 1 autobonds 1 waitfor all
mol addfile /home/losey/cov_loop/5x5b/5x5b_loop_4_wrapped.dcd type dcd first 0 last -1 step 4 filebonds 1 autobonds 1 waitfor all

source /home/apolasa/COVID19/withloop/macros/5x5b_macro.tcl

set all [atomselect top "all"]

set ANTD [atomselect top "ntd1"]
set AS1 [atomselect top "s11"]
set AS2 [atomselect top "s21"]
set BNTD [atomselect top "ntd2"]
set BRBD [atomselect top "rbd2"]
set BS1 [atomselect top "s12"]
set BS2 [atomselect top "s22"]
set CNTD [atomselect top "ntd2"]
set CRBD [atomselect top "rbd3"]
set ARBD [atomselect top "rbd1"]
set CS1 [atomselect top "s13"]
set CS2 [atomselect top "s23"]
set P1 [atomselect top "p1"]
set P2 [atomselect top "p2"]
set P3 [atomselect top "p3"]
set RBM1 [atomselect top "rbm1"]
set RBM2 [atomselect top "rbm2"]
set RBM3 [atomselect top "rbm3"]



set ARBDR [atomselect top "rbd1" frame 0]
set ANTDR [atomselect top "ntd1" frame 0]
set AS1R [atomselect top "s11" frame 0]
set AS2R [atomselect top "s21" frame 0]
set BNTDR [atomselect top "ntd2" frame 0]
set BRBDR [atomselect top "rbd2" frame 0]
set BS1R [atomselect top "s12" frame 0]
set BS2R [atomselect top "s22" frame 0]
set CNTDR [atomselect top "ntd3" frame 0]
set CRBDR [atomselect top "rbd3" frame 0]
set CS1R [atomselect top "s13" frame 0]
set CS2R [atomselect top "s23" frame 0]
set P1R [atomselect top "p1" frame 0]
set P2R [atomselect top "p2" frame 0]
set P3R [atomselect top "p3" frame 0]
set RBM1R [atomselect top "rbm1" frame 0]
set RBM2R [atomselect top "rbm2" frame 0]
set RBM3R [atomselect top "rbm3" frame 0]

set sel1 [atomselect top "water and same residue as (within 5 of rbd1) and noh"]
set sel2 [atomselect top "water and same residue as (within 5 of ntd1) and noh"]
set sel3 [atomselect top "water and same residue as (within 5 of s11) and noh"]
set sel4 [atomselect top "water and same residue as (within 5 of s21) and noh"]
set sel5 [atomselect top "water and same residue as (within 5 of ntd2) and noh"]
set sel6 [atomselect top "water and same residue as (within 5 of rbd2) and noh"]
set sel7 [atomselect top "water and same residue as (within 5 of s12) and noh"]
set sel8 [atomselect top "water and same residue as (within 5 of s22) and noh"]
set sel9 [atomselect top "water and same residue as (within 5 of ntd3) and noh"]
set sel10 [atomselect top "water and same residue as (within 5 of rbd3) and noh"]
set sel11 [atomselect top "water and same residue as (within 5 of s13) and noh"]
set sel12 [atomselect top "water and same residue as (within 5 of s23) and noh"]

set sel13 [atomselect top "water and same residue as (within 5 of rbm1) and noh"]
set sel14 [atomselect top "water and same residue as (within 5 of rbm2) and noh"]
set sel15 [atomselect top "water and same residue as (within 5 of rbm3) and noh"]


set num_steps [molinfo 0 get numframes]
for {set frame 1} {\$frame < \$num_steps} {incr frame} {
    \$all frame \$frame
    \$ANTD frame \$frame
    \$ARBD frame \$frame
    \$AS1 frame \$frame
    \$AS2 frame \$frame
    \$BNTD frame \$frame
    \$BRBD frame \$frame
    \$BS1 frame \$frame
    \$BS2 frame \$frame
    \$CNTD frame \$frame
    \$CRBD frame \$frame
    \$CS1 frame \$frame
    \$CS2 frame \$frame
    \$P1 frame \$frame 
    \$P2 frame \$frame 
    \$P3 frame \$frame 
    \$RBM1 frame \$frame 
    \$RBM2 frame \$frame 
    \$RBM3 frame \$frame 
    \$sel1 frame \$frame
    \$sel2 frame \$frame
    \$sel3 frame \$frame
    \$sel4 frame \$frame
    \$sel5 frame \$frame
    \$sel6 frame \$frame
    \$sel7 frame \$frame
    \$sel8 frame \$frame
    \$sel9 frame \$frame
    \$sel10 frame \$frame
    \$sel11 frame \$frame
    \$sel12 frame \$frame
    \$sel13 frame \$frame
    \$sel14 frame \$frame
    \$sel15 frame \$frame
    \$sel1 update
    \$sel2 update
    \$sel3 update
    \$sel4 update
    \$sel5 update
    \$sel6 update
    \$sel7 update
    \$sel8 update
    \$sel9 update
    \$sel10 update
    \$sel11 update
    \$sel12 update
    \$sel13 update
    \$sel14 update
    \$sel15 update
    set num1 [\$sel1 num]
    set num2 [\$sel2 num]
    set num3 [\$sel3 num]
    set num4 [\$sel4 num]
    set num5 [\$sel5 num]
    set num6 [\$sel6 num]
    set num7 [\$sel7 num]
    set num8 [\$sel8 num]
    set num9 [\$sel9 num]
    set num10 [\$sel10 num]
    set num11 [\$sel11 num]
    set num12 [\$sel12 num]
    set num13 [\$sel13 num]
    set num14 [\$sel14 num]
    set num15 [\$sel15 num]



    puts stderr "\$frame \$num1 \$num2 \$num3 \$num4 \$num5 \$num6 \$num7 \$num8 \$num9 \$num10 \$num11 \$num12 \$num13 \$num14 \$num15"
}
quit

EOF

vmd -dispdev text -e water.tcl 2> water.txt

done
