-- why supercollider (jmcc)

import Sound.SC3.ID

why_supercollider :: UGen
why_supercollider =
    let r = resonz (dust 'a' AR 0.2 * 50) (rand 'a' 200 3200) 0.003
        s = mix (upar 'a' 10 r)
        z = delayN s 0.048 0.048
        c = combL z 0.1 (lfNoise1 'a' KR (rand 'a' 0 0.1) * 0.04 + 0.05) 15
        y = mix (upar 'a' 7 c)
        f i = allpassN i 0.050 (udup 2 (rand 'a' 0 0.05)) 1
        x = useq 'a' 4 f y
    in out 0 (s + 0.2 * x)

main :: IO ()
main = audition why_supercollider

{-
Sound.SC3.UGen.Dot.draw why_supercollider
-}

{-
{var r = {Resonz.ar(Dust.ar(0.2,50),200 + 3000.0.rand,0.003)}
;var s = Mix.ar(Array.fill(10,r))
;var z = DelayN.ar(s,0.048)
;var c = {CombL.ar(z,0.1,LFNoise1.kr(0.1.rand,0.04,0.05),15)}
;var y = Mix.ar(Array.fill(7,c))
;4.do({x = AllpassN.ar(y,0.050,[0.050.rand,0.050.rand],1)})
;s+(0.2*x)}.play
-}

