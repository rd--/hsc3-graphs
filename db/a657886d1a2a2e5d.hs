-- envGen ; env_circle joins the end of the envelope to the start
let e = envelope [6000,700,100] [1,1] [EnvExp,EnvLin]
    c = env_circle_z 0 1 EnvLin e
    f = envGen KR 1 1 0 1 DoNothing c
in (sinOsc AR f 0 + impulse AR 1 0) * 0.1
