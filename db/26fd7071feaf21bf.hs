-- bezier ; dynamic shifting of control points, oscillator
let rt = ar
    (f0,f1) = (200,205)
    f2 = 2
    wId z l r = range l r (lfdNoise3Id z rt f2)
    s = X.bezier rt 100 0.0001 (wId 'α' f0 f1) 0 (mce [0,0,wId 'β' 0.05 0.25,-1.3,wId 'γ' 0.25 0.45,-1.3
                                                     ,0.5,0,wId 'δ' 0.55 0.75,1.3,wId 'ε' 0.75 0.95,1.3
                                                     ,1,0])
in pan2 s (iRandId 'α' (-1) 1) 0.1
