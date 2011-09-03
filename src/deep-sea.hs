-- deep sea (jrhb)

import Sound.SC3.ID
import Sound.SC3.Lang.Pattern.ID

rng :: UGen -> UGen -> UGen -> UGen
rng s l r =
    let m = (r - l) * 0.5
    in mulAdd s m (m + l)

deep_sea :: UGen
deep_sea =
    let amp = 1
        pan = 0
        variation = 0.9
        n = rand 'α' 7 46
        dt1 = 25.0 + rand 'β' (-1.7) 1.7
        dt2 = (dt1 + lfNoise2 'γ' KR 2) * variation * 0.001
        f = 901 + rand 'δ' 0 65
        t = impulse AR (recip dt2) 0 * 100
        count = pulseCount t 0
        mul = count <* n
        u1 = bpf (mul * t) f 1 * 0.1
        f2 = f * ((count `modE` rng (lfNoise1 'ε' KR 1) 2 20) + 1)
        u2 = bpf u1 f2 1 * 0.2
    in mrg [pan2 u2 pan (amp * 10)
           ,detectSilence u2 0.0001 0.2 RemoveSynth]

main :: IO ()
main = do
  let s = synthdef "deep-sea" (out 0 deep_sea)
  audition (s,pbind [("dur",pxrand 'a' [0.25,0.5,1,2] inf)])

{-
Sound.SC3.UGen.Dot.draw (out 0 deep_sea)
audition (out 0 deep_sea)
-}
