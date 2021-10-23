Script and Macros Used for Analysis of MD Trajectories of Spike Proteins Studied in Article: **Prefusion Spike Protein Conformational Changes Are Slower in SARS-CoV-2 Relative to SARS-CoV-1**


**#Distance** (distances-CoV2.tcl and distances-CoV1.tcl)

To quantify the RBM-S2 distance,centers of mass based on residues that form a beta-sheet in the RBM region of each RBD. We then measured the vector distance between the two centers of mass and used the vector magnitude to quantify the overall distance.

**#Angle** (angle-CoV2.tcl and angle-CoV1.tcl)

For the RBM-S2 angle, we chose residues at the top and bottom of the straightest region of the S2 Trimer. The vector  angle  between  the  RBD  and  S2  was  then  calculated  with  the  following  equation:arccos(v1·v2/|v1||v2|).  The computed angle was subtracted from 180◦.  An angle above≈60◦would indicate an RBD in the inactive conformation with respect to S2, and 0-40◦would indicatean RBD in the active conformation.

**#Dynamic Network Analysis** ()
