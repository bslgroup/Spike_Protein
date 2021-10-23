Script and Macros Used for Analysis of MD Trajectories of Spike Proteins Studied in Article: **Prefusion Spike Protein Conformational Changes Are Slower in SARS-CoV-2 Relative to SARS-CoV-1**


**#Distance** (distances-CoV2.tcl and distances-CoV1.tcl)

To quantify the RBM-S2 distance,centers of mass based on residues that form a beta-sheet in the RBM region of each RBD. We then measured the vector distance between the two centers of mass and used the vector magnitude to quantify the overall distance.

**#Angle** (angle-CoV2.tcl and angle-CoV1.tcl)

For the RBM-S2 angle, we chose residues at the top and bottom of the straightest region of the S2 Trimer. The vector  angle  between  the  RBD  and  S2  was  then  calculated  with  the  following  equation:arccos(v1·v2/|v1||v2|).  The computed angle was subtracted from 180◦.  An angle above≈60◦would indicate an RBD in the inactive conformation with respect to S2, and 0-40◦would indicatean RBD in the active conformation.

**#Dynamic Network Analysis** (calc_correlation_custom.py)

MD-TASK, software suite of MDanalysis tools, was used to calculate the correlation coefficient for the motion of each C_alpha atom relative to the other C_alpha atoms.  A correlation matrix M was generated for each of the three protomers in all the simulated trajectories.  Additionally, a correlation matrix for the entire trimer was calculated for each simulation to explore correlations between structures of different protomers.

**#Free Energy Calculations** (PMF_Calculation_Using_RMSD and Free_Energy_Using_RMSD_PMF)


**#Principal Component analysis (PCA)** (pca_out_select.py)

PCA performed with ProDy was used to quantify the persistent conformational changesand relative motions of the active and inactive states. Only the position of the C-alpha atoms of the spike protein was considered when building the covariance matrix of atomic positions, in  order  to  focus  on  the  large  conformational  changes  and  ignore  side  chain  fluctuations. Each trajectory was aligned with the positions from the cryo-EM structure before analysisto remove translational motion of the protein from the variance calculations. The CoV-1/CoV-2 active state (Set 1) and CoV-1/CoV-2 inactive state trajectories were stripped down to trajectories of the individual protomers from each simulation. The individual protomers were then analyzed together to compare and quantify the relative motions of the active and inactive states.  Through eigenvalue decomposition, the top twenty principalcomponents (PCs) were calculated for each protomer. The top two PCs for each protomerhave been plotted to identify the major motions of the protein.
