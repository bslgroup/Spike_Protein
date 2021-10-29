#Bash Script for 
#Following Script does calculate Delta RMSD from above results of your SMD/TMD/MD simulations. 
for i in `seq 0 9`
do

paste $i.dat $i.rmsd | awk '{print $1-$2}' > $i.drmsd

done

#Following awk script does calculate pmf from the delta RMSD

cat ../rmsd/r1.txt | awk '{ 
                        a=int($1/0.01); 
                        n[a]++; 
                        j[a]+=exp(-$2/0.6);
                        i[a]+=$2*$2;
                        k[a]+=$2;    
                         
                        }
                        END{ 
                            for (a in n) {
                                print a*.01, -0.6*log(j[a]/n[a]), sqrt((i[a]/n[a])-((k[a]/n[a])^2)), sqrt((i[a]-(k[a]*k[a]/n[a]))/n[a])/sqrt(n[a]), n[a]

                        }
                    }' | sort -n > rmsd1.txt
