-- rBezier ; dynamic shifting of control points, oscillator
let rt = AR
    (f0,f1) = (200,205)
    f2 = 2
    w z l r = range l r (lfdNoise3 z rt f2)
    s = X.rBezier rt (w 'α' f0 f1) 0 (mce [0,0,w 'β' 0.05 0.25,-1.3,w 'γ' 0.25 0.45,-1.3
                                          ,0.5,0,w 'δ' 0.55 0.75,1.3,w 'ε' 0.75 0.95,1.3
                                          ,1,0])
in pan2 s (iRand 'α' (-1) 1) 0.1
