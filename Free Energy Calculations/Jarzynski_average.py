#Python script for calculating Free energy profile from PMF Caclulations.
from numpy import *



data = genfromtxt("../work/all.dat", dtype=float128)
n = len(data[1])



t = []



for i in range(len(data)):
x = (exp(-data[i]/0.6)).mean()
t.append(-0.6*log(x))



for j in t:
print(j)
