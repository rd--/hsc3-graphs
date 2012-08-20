-- bohlen-pierce-140 (jj)
-- http://sccode.org/1-W

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Pattern.ID {- hsc3-lang -}

bp140u :: UGen
bp140u =
    let f z n = n * (3 ** (rand z 0 17 / 13))
        e = envGen AR 1 0.3 0 1 RemoveSynth (envPerc 0.01 1)
        o = pmOsc AR (f 'a' (mce2 438 442)) (f 'b' 880) (f 'c' e) 0
    in o * e

-- > Sound.SC3.UGen.Dot.draw bp140u
bp140 :: Synthdef
bp140 = synthdef "bp140" (out 0 bp140u)

main :: IO ()
main = audition (bp140,pbind [("dur",prand 'a' [1/6,1/3] inf)])
