# Principal Component analysis of spike protein MD trajectories
#
# Requires package prody
#
# Usage with aligned C-alpha trajecories for individual protomers
# python3 pca_out_select.py <output file name no suffix> <PDB structure file name> <List of 1 or more DCD trajectory files>

import sys
from pathlib import Path
from prody import *
from numpy import *
from string import Template

name = sys.argv[1]
pdbstring = sys.argv[2]
flist = sys.argv[3:]

pdb = pdbstring.split("_")[0].split("/")[1]

struct = parsePDB(pdbstring)
traj = Trajectory('')

label = array([])
frames_old = 0

#Loop over all the DCD files and concatenate
for i,fi in enumerate(flist):
    file = fi.split('/')[-1]
    #name = name + file[:-4] + '_'
    #dcdpath = Path(f'{fi}')
    traj.addFile(fi)
    n_frames = traj.numFrames() - frames_old
    traj_label = zeros(n_frames) + i
    #traj_label_name = [file[:-4] for i in n_frames]
    label = hstack((label,traj_label))
    frames_old = frames_old + n_frames
    print(frames_old)
savetxt(f"{name}_projection_labels.txt",label,fmt="%d")

#Specific selections to omit highly mobile loops
select_dict = {"5x58":"ca and not resnum 17:23 1066 1067"
               ,"5x5b":"ca and not resnum 17:23 1066 1067"
               ,"6vxx":"ca and not resnum 1140:1148"
               ,"6vyb":"ca and not resnum 1140:1148"
              }
#Link to structure file
traj.link(struct)
traj.setCoords(struct)
#Apply appropriate selection for the spike protomer used
s1 = struct.select(select_dict[pdb])
traj.setAtoms(s1)
trajs=traj[:]
#Alignment in prody
trajs.superpose()

#Calculate the PCA
pca=PCA('all')
pca.buildCovariance(traj)
pca.calcModes()
saveModel(pca)

#Save the output files
writeNMD(f'{name}pca.nmd', pca[:20], s1)
writeModes(f"{name}pca-mode-20.txt",pca[:20],format="%.8e")
proj = calcProjection(trajs,pca[:20],rmsd=True,norm=False)
writeArray(f"{name}projection.txt",proj,format="%f")
fract=calcFractVariance(pca[:20])
writeArray(f"{name}fract.txt",fract,format="%f")
var = pca.getVariances()
writeArray(f"{name}variance.txt",var,format="%f")
covar = pca.getCovariance()
trace = trace(covar)
print(f"Trace: {trace}")


quit()
