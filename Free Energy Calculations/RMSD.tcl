#Calculates the RMSD of the protein.
set all [atomselect top "all"]
set ref [atomselect top "segname PROB" frame 0]
set com [atomselect top "segname PROB"]

set num_steps [molinfo top get numframes]
for {set frame 0} {$frame < $num_steps} {incr frame} {
    $all frame $frame
    $com frame $frame

    $all move [measure fit $com $ref]
    set rmsd [measure rmsd $com $ref]
 
    puts stderr "$rmsd" 
}

quit

