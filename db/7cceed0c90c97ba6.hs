-- balance2
let [s0,s1] = mceChannels (sinOsc ar (mce2 440 550) 0)
    n = lfNoise0Id 'α' kr 4
in balance2 s0 s1 n 0.3
