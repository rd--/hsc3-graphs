-- Batuhan Bozkurt 2009 http://www.earslap.com

import Sound.SC3.ID

rng :: UGen -> UGen -> UGen -> UGen
rng l r =
    let m = (r - l) * 0.5
	a = m + l
    in (+ a) . (* m)

offset_id :: Enum a => Int -> a -> Int
offset_id n e = n + fromEnum e

-- mce...........................
microhelix :: UGen
microhelix =
    let rp = replicate
        ctrigs_ z_ =
            let z = offset_id z_
                i = mce (rp 8 (1/8) ++
                         rp 8 (1/4) ++
                         [dseq (z 'a') (drand (z 'b') dinf (mce2 1 2)) (mce2 (1/16) (1/16))])
                d = dxrand (z 'c') dinf (mceMap (* 1.25) i)
            in tDuty AR d 0 DoNothing (dwhite (z 'd') dinf 0.5 1) 0
        ctrigs = mce2 (ctrigs_ 0) (ctrigs_ 12)
        clicks =
            let n = pinkNoise 'e' AR * decay ctrigs (0.001 * abs (lfNoise1 'f' AR 4))
	    in fold (bpf n 15000 0.9 * (25 * rng 0 1 (lfNoise1 'g' AR 8))) (-1) 1
	snd1 =
            let o = sinOsc AR (midiCPS 44) 0 * 0.5 + sinOsc AR (midiCPS 90) 0 * 0.6
	    in lpf o (midiCPS 32) * 2 + hpf (lpf (whiteNoise 'h' AR * 0.008) 12000) 2400
        hiNoise =
            let n = whiteNoise 'i' AR
                e = decay2 (ctrigs * (lfNoise1 'j' AR 8 * 0.5 + 0.5)) 0.02 0.1 * 0.05
            in bpf (n * e) (tRand 'k' 12000 15000 ctrigs) 0.9
	trigMod = roundTo (lfNoise0 'l' AR 8) 1
	bass =
            let t = mceChannel 0 ctrigs * trigMod
                ph = sweep t (2 * pi * mce2 52.8 740) + (pi/3)
                ph' = wrap ph (-pi) pi
                mean u = mceSum u / fromIntegral (mceDegree u)
                o = tanh (mean (sinOsc AR 0 ph' * mce2 2 0.05))
                d = env [0, 0.5, 0.4, 0] [0, 0.2, 0.01] [EnvNum (-5)] 0 0
                e = envGen AR (abs t) 1 0 1 DoNothing d
	    in o * e * 0.25
        snd1' =
            let t = mceChannel 0 ctrigs
                d = env [0, 1, 0.6, 0] [0.0001, 0.4, 0.01] [EnvNum (-4)] 0 0
                e = envGen AR (t * lfNoise0 'm' AR 8) 1 0 1 DoNothing d
	    in pan2 (snd1 * e) (tRand 'n' (-1) 1 t) 1
    in limiter (midEQ (clicks + snd1' + hiNoise + bass) 14000 0.7 8) 1 0.01

main :: IO ()
main = audition (out 0 microhelix)

{-
Sound.SC3.UGen.Dot.draw microhelix
-}
