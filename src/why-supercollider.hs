-- why supercollider (jmcc)

import Sound.SC3.ID

chain :: Int -> (t -> t) -> t -> t
chain j f x = if j < 1 then x else chain (j - 1) f (f x)

why_supercollider :: UGen
why_supercollider =
    let r e = resonz (dust e AR 0.2 * 50) (rand e 200 3200) 0.003
        s = mixFill 10 r
        z = delayN s 0.048 0.048
        c e = combL z 0.1 (lfNoise1 e KR (rand e 0 0.1) * 0.04 + 0.05) 15
        y = mixFill 7 c
        x = chain 4 (\i -> allpassN i 0.050 (dup (rand i 0 0.05)) 1) y
    in out 0 (s + 0.2 * x)

main :: IO ()
main = audition why_supercollider

{-
{var r = {Resonz.ar(Dust.ar(0.2,50),200 + 3000.0.rand,0.003)}
;var s = Mix.ar(Array.fill(10,r))
;var z = DelayN.ar(s,0.048)
;var c = {CombL.ar(z,0.1,LFNoise1.kr(0.1.rand,0.04,0.05),15)}
;var y = Mix.ar(Array.fill(7,c))
;4.do({x = AllpassN.ar(y,0.050,[0.050.rand,0.050.rand],1)})
;s+(0.2*x)}.play
-}

