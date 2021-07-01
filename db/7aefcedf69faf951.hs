-- freqShift
let e = lfGauss ar 4 (1/8) 0 Loop DoNothing
    o = blip ar 60 4 * e
    a = o / 4 + localIn 2 ar 0
    s = freqShift a (lfNoise0Id 'α' kr (1/4) * 90) 0
    z = delayC s 1 0.1 * 0.9
in mrg2 s (localOut z)
