### Distance calculations for SARS CoV-1 ###

set all [atomselect top "all"]
set ARBD [atomselect top "rbd1"]
# beta sheet region of rbm
set ARBM [atomselect top "rbm1 and (resid 439 to 441 479 to 481)"]
set ANTD [atomselect top "ntd1"]
set AS1 [atomselect top "s11"]
set BRBD [atomselect top "rbd2"]
set BRBM [atomselect top "rbm2"]
set BNTD [atomselect top "ntd2"]
set BS1 [atomselect top "s12"]
set CRBD [atomselect top "rbd3"]
set CRBM [atomselect top "rbm3"]
set CNTD [atomselect top "ntd3"]
set CS1 [atomselect top "s13"]
set S2 [atomselect top "trimer"]
set ref [atomselect top "all" frame 0]
set com [atomselect top "all"]

set num_steps [molinfo 0 get numframes]
for {set frame 0} {$frame < $num_steps} {incr frame} {
    $all frame $frame
    $ARBD frame $frame
    $ARBM frame $frame
    $ANTD frame $frame
    $AS1 frame $frame
    $BRBD frame $frame
    $BRBM frame $frame
    $BNTD frame $frame
    $BS1 frame $frame
    $CRBD frame $frame
    $CRBM frame $frame
    $CNTD frame $frame
    $CS1 frame $frame
    $com frame $frame
    $S2 frame $frame

    $all move [measure fit $com $ref]

    set d1 [vecsub [measure center $ARBM] [measure center $S2]]
    set d2 [vecsub [measure center $ANTD] [measure center $AS1]]
    set d3 [vecsub [measure center $ANTD] [measure center $ARBM]]
    set d4 [vecsub [measure center $BRBM] [measure center $S2]]
    set d5 [vecsub [measure center $BNTD] [measure center $BS1]]
    set d6 [vecsub [measure center $BNTD] [measure center $BRBM]]
    set d7 [vecsub [measure center $CRBM] [measure center $S2]]
    set d8 [vecsub [measure center $CNTD] [measure center $CS1]]
    set d9 [vecsub [measure center $CNTD] [measure center $CRBM]]
    set d10 [vecsub [measure center $ARBD] [measure center $ANTD]]
    set d11 [vecsub [measure center $BRBD] [measure center $BNTD]]
    set d12 [vecsub [measure center $CRBD] [measure center $CNTD]]

    set m1 [veclength $d1]
    set m2 [veclength $d2]
    set m3 [veclength $d3]
    set m4 [veclength $d4]
    set m5 [veclength $d5]
    set m6 [veclength $d6]
    set m7 [veclength $d7]
    set m8 [veclength $d8]
    set m9 [veclength $d9]
    set m10 [veclength $d10]
    set m11 [veclength $d11]
    set m12 [veclength $d12]

    puts stderr "$frame $m1 $m2 $m3 $m4 $m5 $m6 $m7 $m8 $m9 $m10 $m11 $m12"

}
quit
