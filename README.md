Script and Macros Used for Analysis of MD Trajectories of Spike Proteins Studied in Article: **Prefusion Spike Protein Conformational Changes Are Slower in SARS-CoV-2 Relative to SARS-CoV-1**


**#Distance** (distances-CoV2.tcl and distances-CoV1.tcl)

To quantify the RBM-S2 distance,centers of mass based on residues that form a beta-sheet in the RBM region of each RBD. The distance script measured the vector distance between the two centers of mass and used the vector magnitude to quantify the overall distance.

**#Angle** (angle-CoV2.tcl and angle-CoV1.tcl)

For the RBM-S2 angle, we chose residues at the top and bottom of the straightest region of the S2 Trimer. The angle script measures, vector  angle  between  the  RBD  and  S2  was  then  calculated  with  the  following  equation:arccos(v1·v2/|v1||v2|) then computed angle was subtracted from 180◦.

**#Dynamic Network Analysis** (calc_correlation_custom.py)

MD-TASK, software suite of MD analysis tools, was used to calculate the correlation coefficient for the motion of each C_alpha atom relative to the other C_alpha atoms.  A correlation matrix M was generated for each of the three protomers in all the simulated trajectories.  Additionally, a correlation matrix for the entire trimer was calculated for each simulation to explore correlations between structures of different protomers.

**#Free Energy Calculations** (PMF_Calculation_Using_RMSD and Free_Energy_Using_RMSD_PMF)


**#Principal Component analysis (PCA)** (pca_out_select.py)

PCA performed with ProDy was used to quantify the persistent conformational changes and relative motions of the active and inactive states.

**#Water Analysis** (do_water.sh and do_waterACE2.sh)

The  amount  of  solvent  around  the  receptor-binding  motif  (RBM)  was  quantified  using water analysis script. This calculates the number of water molecules within 5 ̊A of the RBM for every frame of trajectory. Macros used in the water analysis are listed under marcos folder. 

**#Simulation files** (minimize_relax.conf, restrain.conf, equilibration.conf, COV1_PDB and COV2_PDB)
The simulation step file to run molecular dynamic simulations and structure coordinate files of COV1 and COV2 are provided for active and inactive sates.
