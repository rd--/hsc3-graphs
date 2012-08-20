-- Alberto de Campo & Julian Rohrhuber, March 2003

import Sound.SC3.ID {- hsc3 -}

kabelScahden :: UGen
kabelScahden =
    let freq = 50
        sustain = 1
        amp = 0.5
        hum = let t = dust 'a' KR (7 ** lfNoise1 'a' KR 0.3)
                  h = toggleFF (coinGate 'b' 0.4 t) * rlpf (lfPulse AR freq 0 0.5 + (lfNoise1 'b' KR 2 * 0.5 - 0.5)) 6000 0.15
                  n = trig t (tRand 'c' 0 0.01 (coinGate 'c' 0.4 t)) * whiteNoise 'c' AR
                  m = trig t (tRand 'd' 0 0.01 (coinGate 'd' 0.4 t)) * brownNoise 'd' AR
                  k = trig t (lfNoise1 'e' KR (mce2 4 4.2) * 0.1 + 0.11) * lfClipNoise 'e' AR (lfNoise0 'e' KR 7 * 30 + 40)
              in distort (leakDC ((h + n + m + k) * 10) 0.995)
        e = envGen KR 1 1 0 1 RemoveSynth (Envelope [amp,amp,0] [sustain,0] [] Nothing Nothing)
    in out 0 (clip2 hum 1 * e * 0.25)

main :: IO ()
main = audition kabelScahden

-- Local Variables:
-- truncate-lines:t
-- End:
