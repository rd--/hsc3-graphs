-- envGen ; https://www.listarc.bham.ac.uk/lists/sc-users/msg14815.html
let n = range 0.01 0.15 (lfNoise1Id 'α' kr 2)
    e = Envelope [0,1] [n] [EnvLin] Nothing (Just 0) 0
    c = env_circle_0 e
    a = envGen ar 1 1 0 1 DoNothing c
in sinOsc ar (a * 400 + 500) 0 * 0.1
