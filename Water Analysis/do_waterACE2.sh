#!/bin/bash
#This script counts the amount of water molecules within 5 Angstrom of each spike protein receptor binding component specified in the macro files system_ACE2.tcl.
#The macros for each component for each system are uploaded to the macros folder.
#This is a sample script for a 5x5b system that you can easily modify and run for different systems/Proteins.

a=("6vxx" )


for j in `seq 0 0` # loops through 5 sub directories 
do 


cat > water_ace2.tcl << EOF

mol new /home/losey/cov_loop/5x5b/step3_charmm2namd.psf
mol addfile /home/losey/cov_loop/5x5b/step3_charmm2namd.pdb
mol addfile /home/losey/cov_loop/5x5b/5x5b_loop_eq_wrapped.dcd type dcd first 0 last -1 step 8 filebonds 1 autobonds 1 waitfor all
mol addfile /home/losey/cov_loop/5x5b/5x5b_loop_1_wrapped.dcd type dcd first 0 last -1 step 4 filebonds 1 autobonds 1 waitfor all
mol addfile /home/losey/cov_loop/5x5b/5x5b_loop_2_wrapped.dcd type dcd first 0 last -1 step 4 filebonds 1 autobonds 1 waitfor all
mol addfile /home/losey/cov_loop/5x5b/5x5b_loop_3_wrapped.dcd type dcd first 0 last -1 step 4 filebonds 1 autobonds 1 waitfor all
mol addfile /home/losey/cov_loop/5x5b/5x5b_loop_4_wrapped.dcd type dcd first 0 last -1 step 4 filebonds 1 autobonds 1 waitfor all

source /home/apolasa/COVID19/withloop/macros/5x5b_Ace2.tcl

set all [atomselect top "all"]
set RBM1 [atomselect top "rbm1"]
set RBM2 [atomselect top "rbm2"]
set RBM3 [atomselect top "rbm3"]
set RB1 [atomselect top "rb1"]
set RB2 [atomselect top "rb2"]
set RB3 [atomselect top "rb3"]
set RBS1 [atomselect top "rbs1"]
set RBS2 [atomselect top "rbs2"]
set RBS3 [atomselect top "rbs3"]


set RBM1R [atomselect top "rbm1" frame 0]
set RBM2R [atomselect top "rbm2" frame 0]
set RBM3R [atomselect top "rbm3" frame 0]
set RB1R [atomselect top "rb1" frame 0]
set RB2R [atomselect top "rb2" frame 0]
set RB3R [atomselect top "rb3" frame 0]
set RBS1R [atomselect top "rbs1" frame 0]
set RBS2R [atomselect top "rbs2" frame 0]
set RBS3R [atomselect top "rbs3" frame 0]

set sel1 [atomselect top "water and same residue as (within 5 of rbm1) and noh"]
set sel2 [atomselect top "water and same residue as (within 5 of rbm2) and noh"]
set sel3 [atomselect top "water and same residue as (within 5 of rbm3) and noh"]

set sel4 [atomselect top "water and same residue as (within 5 of rb1) and noh"]
set sel5 [atomselect top "water and same residue as (within 5 of rb2) and noh"]
set sel6 [atomselect top "water and same residue as (within 5 of rb3) and noh"]

set sel7 [atomselect top "water and same residue as (within 5 of rbs1) and noh"]
set sel8 [atomselect top "water and same residue as (within 5 of rbs2) and noh"]
set sel9 [atomselect top "water and same residue as (within 5 of rbs3) and noh"]

set sel10 [atomselect top "water and same residue as (within 4 of rbm1) and noh"]
set sel11 [atomselect top "water and same residue as (within 4 of rbm2) and noh"]
set sel12 [atomselect top "water and same residue as (within 4 of rbm3) and noh"]

set sel13 [atomselect top "water and same residue as (within 4 of rb1) and noh"]
set sel14 [atomselect top "water and same residue as (within 4 of rb2) and noh"]
set sel15 [atomselect top "water and same residue as (within 4 of rb3) and noh"]

set sel16 [atomselect top "water and same residue as (within 4 of rbs1) and noh"]
set sel17 [atomselect top "water and same residue as (within 4 of rbs2) and noh"]
set sel18 [atomselect top "water and same residue as (within 4 of rbs3) and noh"]

set sel19 [atomselect top "water and same residue as (within 3 of rbm1) and noh"]
set sel20 [atomselect top "water and same residue as (within 3 of rbm2) and noh"]
set sel21 [atomselect top "water and same residue as (within 3 of rbm3) and noh"]

set sel22 [atomselect top "water and same residue as (within 3 of rb1) and noh"]
set sel23 [atomselect top "water and same residue as (within 3 of rb2) and noh"]
set sel24 [atomselect top "water and same residue as (within 3 of rb3) and noh"]

set sel25 [atomselect top "water and same residue as (within 3 of rbs1) and noh"]
set sel26 [atomselect top "water and same residue as (within 3 of rbs2) and noh"]
set sel27 [atomselect top "water and same residue as (within 3 of rbs3) and noh"]


set num_steps [molinfo 0 get numframes]
for {set frame 1} {\$frame < \$num_steps} {incr frame} {
    \$all frame \$frame
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
    \$sel16 frame \$frame
    \$sel17 frame \$frame
    \$sel18 frame \$frame
    \$sel19 frame \$frame
    \$sel20 frame \$frame
    \$sel21 frame \$frame
    \$sel22 frame \$frame
    \$sel23 frame \$frame
    \$sel24 frame \$frame
    \$sel25 frame \$frame
    \$sel26 frame \$frame
    \$sel27 frame \$frame
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
    \$sel16 update
    \$sel17 update
    \$sel18 update
    \$sel19 update
    \$sel20 update
    \$sel21 update
    \$sel22 update
    \$sel23 update
    \$sel24 update
    \$sel25 update
    \$sel26 update
    \$sel27 update
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
    set num16 [\$sel16 num]
    set num17 [\$sel17 num]
    set num18 [\$sel18 num]
    set num19 [\$sel19 num]
    set num20 [\$sel20 num]
    set num21 [\$sel21 num]
    set num22 [\$sel22 num]
    set num23 [\$sel23 num]
    set num24 [\$sel24 num]
    set num25 [\$sel25 num]
    set num26 [\$sel26 num]
    set num27 [\$sel27 num]



    puts stderr "\$frame \$num1 \$num2 \$num3 \$num4 \$num5 \$num6 \$num7 \$num8 \$num9 \$num10 \$num11 \$num12 \$num13 \$num14 \$num15 \$num16 \$num17 \$num18 \$num19 \$num20 \$num21 \$num22 \$num23 \$num24 \$num25 \$num26 \$num27"
}
quit

EOF

vmd -dispdev text -e water_ace2.tcl 2> water_ace2.txt

done
