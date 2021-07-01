-- random pulsations (jmcc) #1 ; texture=spawn,1.25,inf
let e = envLinen 2 5 2 0.02
    o1 = fSinOsc ar (rand 0 2000) 0 * envGen kr 1 1 0 1 DoNothing e
    o2 = sinOsc ar (linRand 8 88 0) 0
    o3 = sinOsc kr (rand 0.3 0.8) (rand 0 (2 * pi)) * 0.7
in pan2 (o1 `amClip` o2) o3 1
