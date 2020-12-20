-- envGen ; c.f. envXYC ; non-linear Phasor ; positive half traversed more quickly than negative
let e = envXYC [(0,0,EnvNum (-0.5)),(0.4,pi,EnvNum 0.5),(1,two_pi,EnvLin)]
    o = sinOsc KR 0 (envGen KR 1 1 0 2 DoNothing (env_circle_0 e))
in (soundIn 0 + pinkNoise 'α' AR * 0.1) * range 0.25 1 o
