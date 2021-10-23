### RBD-S2 Angle Calculation Script for SARS CoV-2 ### 

set all [atomselect top "all"]
set ARBD1 [atomselect top "rbd1 and resid 391 and alpha"]
set ARBD2 [atomselect top "rbd1 and resid 493 and alpha"]
set t1 [atomselect top "trimer and resid 914 and alpha" ]
set t2 [atomselect top "trimer and resid 987 and alpha" ]
set ref [atomselect top "protein and alpha" frame 0]
set com [atomselect top "protein and alpha"]

set num_steps [molinfo top get numframes]
for {set frame 0} {$frame < $num_steps} {incr frame} {
    $all frame $frame
    $ARBD1 frame $frame
    $ARBD2 frame $frame
    $com frame $frame
    $t1 frame $frame
    $t2 frame $frame

    # Align protein to reference
    $all move [measure fit $com $ref]

    # Construct vectors
    set d1 [vecsub [measure center $ARBD2] [measure center $ARBD1]]
    set d2 [vecsub [measure center $t1] [measure center $t2]]

    # Calculate vector lengths
    set m1 [veclength $d1]
    set m2 [veclength $d2]

    # Take dot product of vectors 
    set dot [vecdot $d1 $d2]

    # Calculate ratio of dot product and product of lengths
    set u1 [expr $dot / [expr $m1 * $m2]]

    # Calculate the angle and convert from radians to degrees
    set o1 [expr 180*(acos($u1))/acos(-1)]

    # Report the frame number and the angle
    puts stderr "$frame [expr 180-$o1]"
}

quit
