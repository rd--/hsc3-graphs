-- random pulsations (jmcc) #1 ; texture=spawn,1.25,inf ; id
let e = envLinen 2 5 2 0.02
    o1 = fSinOsc ar (randId 'α' 0 2000) 0 * envGen kr 1 1 0 1 DoNothing e
    o2 = sinOsc ar (linRandId 'β' 8 88 0) 0
    o3 = sinOsc kr (randId 'γ' 0.3 0.8) (randId 'δ' 0 (2 * pi)) * 0.7
in pan2 (o1 `amClip` o2) o3 1
