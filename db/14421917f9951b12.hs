-- envGen ; c.f. envXyc ; non-linear Phasor ; positive half traversed more quickly than negative
let e = envXyc [(0,0,EnvNum (-0.5)),(0.4,pi,EnvNum 0.5),(1,two_pi,EnvLin)]
    o = sinOsc kr 0 (envGen kr 1 1 0 2 DoNothing (env_circle_0 e))
in (soundIn 0 + pinkNoiseId 'α' ar * 0.1) * range 0.25 1 o
