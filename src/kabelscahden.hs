-- Kabelscahden
-- Alberto de Campo and Julian Rohrhuber, 3/2003

import Sound.SC3.ID

kabelscahden :: UGen
kabelscahden =
    let t = dust 'a' KR (7 ** lfNoise1 'b' KR 0.3)
	h' = toggleFF (coinGate 'd' 0.4 t)
	h = h' * rlpf (lfPulse AR 50 0 0.5 + (lfNoise1 'e' KR 2 * 0.5 - 0.5)) 6000 0.15
	n = trig t (tRand 'f' 0 0.01 (coinGate 'g' 0.4 t)) * whiteNoise 'h' AR
	m = trig t (tRand 'i' 0 0.01 (coinGate 'j' 0.4 t)) * brownNoise 'k' AR
	k' = trig t (lfNoise1 'l' KR (mce2 4 4.2) * 0.1 + 0.11)
        k = k' * lfClipNoise 'm' AR (lfNoise0 'n' KR 7 * 30 + 40)
    in out 0 (distort (leakDC ((h + n + m + k) * 10) 0.995))

main :: IO ()
main = audition kabelscahden
