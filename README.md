Script and Macros Used for Analysis of MD Trajectories of Spike Proteins Studied in Article: **Prefusion Spike Protein Conformational Changes Are Slower in SARS-CoV-2 Relative to SARS-CoV-1** 
Authors: Vivek Govind Kumar, Dylan S Ogden, Ugochi H Isu, Adithya Polasa, James Losey, and Mahmoud Moradi


**#Distance** (distances-CoV2.tcl and distances-CoV1.tcl)

This VMD scripts calculates the RBM-S2 distance, center of mass based on residues that form a beta-sheet in the RBM region of each RBD. 
This distance script measures the vector distance between the two center of mass and used the vector magnitude to output the overall distance.

**#Angle** (angle-CoV2.tcl and angle-CoV1.tcl)

These are VMD scripts For the RBM-S2 angle calculations, we chose residues at the top and bottom of the straightest region of the S2 Trimer. The angle script measures, vector  angle  between  the  RBD  and  S2  was  then  calculated  with  the  following  equation:**arccos(v1·v2/|v1||v2|)** then computed angle was subtracted from 180◦.

**#Dynamic Network Analysis** (calc_correlation_custom.py)

This is done using python package MD-TASK, software suite of MD analysis tools, was used to calculate the correlation coefficient for the motion of each C_alpha atom relative to the other C_alpha atoms.  A correlation matrix M was generated for each of the three protomers in all the simulated trajectories. Additionally, a correlation matrix for the entire trimer was calculated for each simulation to explore correlations between structures of different protomers.

**#Free Energy Calculations** (RMSD.tcl, Jarzynski_average.py, and BashScript.sh )

**Pytho script**
Loads accumulated work from 10 TMD simulation replicates and calculates the Jarzynski average for each line and saves results into a text file. 
**RMSD tcl script - VMD **

Calculates the RMSD of the active/inactive protomer for a given system for all TMD frames. All the atoms are aligned onto a reference structure (equilibrated reference structure), each frame, that is opposite to the initial conformation before TMD. For example if the system starts with an active protomer for TMD and is steered towards inactive, the reference structure will be an equilibrated structure with all three inactive protomers. CoV1 is always aligned with CoV1 and CoV2 with CoV2.

**Shell script **

This script pastes the RMSD data from TMD and VMD calculated. Then it will take the difference and report the RMSD and accumulated work.  
Next, using the DRMSD data, the data is binned using 100 bins. The Jarzynski average is then calculated from the binned data associated with a specific work value. Finally the data reported is the  RMSD, Jarzynski average, standard deviation, standard error, and the number of counts.

**#Principal Component analysis (PCA)** (pca_out_select.py)

PCA performed with ProDy using this python script to quantify the persistent conformational changes and relative motions of the active and inactive states.

**#Water Analysis** (do_water.sh and do_waterACE2.sh)

The amount  of  solvent  around  the  receptor-binding  motif  (RBM)  was  quantified  using water analysis VMD script. This calculates the number of water molecules within 5 ̊A of the RBM for every frame of trajectory. Macros used in the water analysis are listed under marcos folder. 

**#Simulation files** (minimize_relax.conf, restrain.conf, equilibration.conf, COV1_PDB and COV2_PDB)
The simulation step file to run molecular dynamics simulations and structure coordinate files of COV1 and COV2 are provided for active and inactive sates.

**TMD Simulation** (tmd0.conf, tmd1.conf and colvars.conf)
The simulation step file to run targeted molecular dynamics simulations and structure coordinate files used in this simulutations of COV1 and COV2 are provide.
