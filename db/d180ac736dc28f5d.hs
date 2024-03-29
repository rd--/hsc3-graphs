-- twoTube
let tr = impulse kr (mouseX kr 1 16 Linear 0.2) 0
    dly1 = tRandId 'α' 1 300 tr
    dly2 = tRandId 'β' 1 300 tr
    loss = tRandId 'γ' 0.9 0.999 tr
    dur = tRandId 'δ' 0.1 5 tr
    pan = tRandId 'ε' (-1) 1 tr
    k = tRandId 'ζ' (-1) 1 tr
    env = envelope [1,1,0,0] [(dly1 + dly2) / sampleRate,0,1] [EnvLin]
    src = whiteNoiseId 'η' ar * envGen ar tr 1 0 1 DoNothing env
in pan2 (X.twoTube ar src k loss dly1 dly2) pan (mouseY kr 0.1 0.4 Exponential 0.2)
