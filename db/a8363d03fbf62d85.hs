-- membraneHexagon ; mouse control
let mb = mouseButton kr 0 1 0.2
    mx = mouseX kr 0.01 0.1 Linear 0.2
    my = mouseY kr 0.999999 0.999 Exponential 0.2
    ex = pinkNoiseId 'α' ar * envGen kr mb 0.4 0 0.1 DoNothing (envPerc 0.01 1)
in X.membraneHexagon ar ex mx my
