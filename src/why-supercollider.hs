-- why supercollider (jmcc)

import Sound.SC3.ID
import Sound.SC3.UGen.External.RDU {- sc3-rdu -}

why_supercollider :: UGen
why_supercollider =
    let r = resonz (dust 'a' AR 0.2 * 50) (rand 'a' 200 3200) 0.003
        s = mix (uclone 'a' 10 r)
        z = delayN s 0.048 0.048
        c = combL z 0.1 (lfNoise1 'a' KR (rand 'a' 0 0.1) * 0.04 + 0.05) 15
        y = mix (uclone 'a' 7 c)
        f i = allpassN i 0.050 (randN 2 'a' 0 0.05) 1
        x = useq 'a' 4 f y
    in out 0 (s + 0.2 * x)

main :: IO ()
main = audition why_supercollider

{-
Sound.SC3.UGen.Dot.draw why_supercollider
-}
