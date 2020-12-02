-- sweep ; f0 (sc-users, 2012-02-09)
let lf = range 0.01 1.25 (lfNoise2 'α' KR 1)
    du = duty AR lf 0 DoNothing lf
    tr = abs (hpz1 du) `greater_than` 0
    ph = sweep tr (1/du)
    fr = linExp ph 0 1 400 800
in sinOsc AR fr 0 * 0.2
