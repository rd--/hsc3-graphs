-- twoTube
let dly1 = 100
    dly2 = 40
    env = envelope [1,1,0] [(dly1 + dly2) / sampleRate,0.0] [EnvLin]
    x = mouseX kr (-1) 1 Linear 0.2
    y = mouseY kr 1 4 Linear 0.2
    src = whiteNoiseId 'α' ar * envGen ar (impulse kr y 0) 1 0 1 DoNothing env
in X.twoTube ar src x 0.99 dly1 dly2 * 0.5
