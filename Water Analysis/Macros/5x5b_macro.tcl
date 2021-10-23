atomselect macro ntd1 {protein and (segname PROA and resid 18 to 292) and alpha}
atomselect macro rbd1 {protein and (segname PROA and resid 318 to 513) and alpha}
atomselect macro rbm1 {protein and (segname PROA and resid 424 to 495) and alpha}
atomselect macro s11 {protein and (segname PROA and resid 18 to 662) and alpha}
atomselect macro s21 {protein and (segname PROA and resid 672 to 1104) and alpha}

atomselect macro ntd2 {protein and (segname PROB and resid 18 to 292) and alpha}
atomselect macro rbd2 {protein and (segname PROB and resid 318 to 513) and alpha}
atomselect macro rbm2 {protein and (segname PROB and resid 424 to 495) and alpha}
atomselect macro s12 {protein and (segname PROB and resid 18 to 662) and alpha}
atomselect macro s22 {protein and (segname PROB and resid 672 to 1104) and alpha}

atomselect macro ntd3 {protein and (segname PROC and resid 18 to 292) and alpha}
atomselect macro rbd3 {protein and (segname PROC and resid 318 to 513) and alpha}
atomselect macro rbm3 {protein and (segname PROC and resid 424 to 495) and alpha}
atomselect macro s13 {protein and (segname PROC and resid 18 to 662) and alpha}
atomselect macro s23 {protein and (segname PROC and resid 672 to 1104) and alpha}

atomselect macro p1 {protein and segname PROA and alpha}
atomselect macro p2 {protein and segname PROB and alpha}
atomselect macro p3 {protein and segname PROC and alpha}

atomselect macro trimer {s21 or s22 or s23}

atomselect macro sT21 {protein and (segname PROA and resid 672 to 820) and alpha}
atomselect macro sT22 {protein and (segname PROB and resid 672 to 820) and alpha}
atomselect macro sT23 {protein and (segname PROC and resid 672 to 820) and alpha}

atomselect macro Ttrimer {sT21 or sT22 or sT23}
