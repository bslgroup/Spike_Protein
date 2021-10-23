### RBD-S2 angle calculation for SARS CoV-1 ###
### Shows calculation of all three angles ###

set all [atomselect top "all"]
set ARBD1 [atomselect top "segname PROA and resid 348"]
set ARBD2 [atomselect top "segname PROA and resid 478"]
set BRBD1 [atomselect top "segname PROB and resid 348"]
set BRBD2 [atomselect top "segname PROB and resid 478"]
set CRBD1 [atomselect top "segname PROC and resid 348"]
set CRBD2 [atomselect top "segname PROC and resid 478"]
set t1 [atomselect top "resid 1016" ]
set t2 [atomselect top "resid 970" ]
set ref [atomselect top "all" frame 0]
set com [atomselect top "all"]

set num_steps [molinfo 0 get numframes]
for {set frame 0} {$frame < $num_steps} {incr frame} {
    $all frame $frame
    $ARBD1 frame $frame
    $ARBD2 frame $frame
    $BRBD1 frame $frame
    $BRBD2 frame $frame
    $CRBD1 frame $frame
    $CRBD2 frame $frame
    $com frame $frame
    $t1 frame $frame
    $t2 frame $frame

    $all move [measure fit $com $ref]

    set d1 [vecsub [measure center $ARBD1] [measure center $ARBD2]]
    set d2 [vecsub [measure center $BRBD1] [measure center $BRBD2]]
    set d3 [vecsub [measure center $CRBD1] [measure center $CRBD2]]
    set d4 [vecsub [measure center $t2] [measure center $t1]]

    set m1 [veclength $d1]
    set m2 [veclength $d2]
    set m3 [veclength $d3]
    set m4 [veclength $d4]

    set dot1 [vecdot $d1 $d4]
    set dot2 [vecdot $d2 $d4]
    set dot3 [vecdot $d3 $d4]

    set u1 [expr $dot1 / [expr $m1 * $m4]]
    set u2 [expr $dot2 / [expr $m2 * $m4]]
    set u3 [expr $dot3 / [expr $m3 * $m4]]

    set o1 [expr 180*(acos($u1))/acos(-1)]
    set o2 [expr 180*(acos($u2))/acos(-1)]
    set o3 [expr 180*(acos($u3))/acos(-1)]

    puts stderr "$frame $o1 $o2 $o3"
}

quit
