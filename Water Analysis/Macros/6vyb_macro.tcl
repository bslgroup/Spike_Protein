atomselect macro ntd2 {protein and (segname PROA and resid 27 to 303) and alpha}
atomselect macro rbd2 {protein and (segname PROA and resid 319 to 541) and alpha}
atomselect macro rbm2 {protein and (segname PROA and resid 437 to 508) and alpha}
atomselect macro s12 {protein and (segname PROA and resid 27 to 676) and alpha}
atomselect macro s22 {protein and (segname PROA and resid 690 to 1147) and alpha}

atomselect macro ntd1 {protein and (segname PROB and resid 27 to 303) and alpha}
atomselect macro rbd1 {protein and (segname PROB and resid 319 to 541) and alpha}
atomselect macro rbm1 {protein and (segname PROB and resid 437 to 508) and alpha}
atomselect macro s11 {protein and (segname PROB and resid 27 to 676) and alpha}
atomselect macro s21 {protein and (segname PROB and resid 690 to 1147) and alpha}

atomselect macro ntd3 {protein and (segname PROC and resid 27 to 303) and alpha}
atomselect macro rbd3 {protein and (segname PROC and resid 319 to 541) and alpha}
atomselect macro rbm3 {protein and (segname PROC and resid 437 to 508) and alpha}
atomselect macro s13 {protein and (segname PROC and resid 27 to 676) and alpha}
atomselect macro s23 {protein and (segname PROC and resid 690 to 1147) and alpha}

atomselect macro p2 {protein and segname PROA and alpha}
atomselect macro p1 {protein and segname PROB and alpha}
atomselect macro p3 {protein and segname PROC and alpha}

atomselect macro trimer {s21 or s22 or s23}

atomselect macro sT22 {protein and (segname PROA and resid 690 to 840) and alpha}
atomselect macro sT21 {protein and (segname PROB and resid 690 to 840) and alpha}
atomselect macro sT23 {protein and (segname PROC and resid 690 to 840) and alpha}

atomselect macro Ttrimer {sT21 or sT22 or sT23}
