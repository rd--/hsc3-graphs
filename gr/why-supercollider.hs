-- why supercollider (jmcc)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.UGen.Protect
import Sound.SC3.UGen.External.RDU {- sc3-rdu -}

-- > Sound.SC3.UGen.Dot.draw why_supercollider
why_supercollider :: UGen
why_supercollider =
    let r = resonz (dust 'α' AR 0.2 * 50) (rand 'α' 200 3200) 0.003
        s = mix (uclone 'α' 10 r)
        z = delayN s 0.048 0.048
        c = combL z 0.1 (lfNoise1 'α' KR (rand 'α' 0 0.1) * 0.04 + 0.05) 15
        y = mix (uclone 'α' 7 c)
        f i = allpassN i 0.050 (randN 2 'α' 0 0.05) 1
        x = useq 'α' 4 f y
    in out 0 (s + 0.2 * x)

main :: IO ()
main = audition why_supercollider
