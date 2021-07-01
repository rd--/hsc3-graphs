-- MiRipples ; filter sweep + distortion
let cf = range 0.1 0.9 (lfTri kr 0.03 0)
in X.miRipples (saw ar 40) cf 0.8 4 * 0.2
