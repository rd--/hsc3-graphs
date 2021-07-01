-- envGen ; env_circle joins the end of the envelope to the start
let e = envelope [6000,700,100] [1,1] [EnvExp,EnvLin]
    c = env_circle_z 0 1 EnvLin e
    f = envGen kr 1 1 0 1 DoNothing c
in (sinOsc ar f 0 + impulse ar 1 0) * 0.1
