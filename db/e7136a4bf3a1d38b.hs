-- changed ; simple composition of hpz1 and greater_than
let s = lfNoise0Id 'α' kr 2
    c = changed s 0
    c' = decay2 c 0.01 0.5
in sinOsc ar (440 + mce2 s c' * 440) 0 * 0.1
