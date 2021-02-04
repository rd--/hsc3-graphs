-- membraneHexagon ; mouse control
let mb = mouseButton KR 0 1 0.2
    mx = mouseX KR 0.01 0.1 Linear 0.2
    my = mouseY KR 0.999999 0.999 Exponential 0.2
    ex = pinkNoise 'α' AR * envGen KR mb 0.4 0 0.1 DoNothing (envPerc 0.01 1)
in X.membraneHexagon AR ex mx my
