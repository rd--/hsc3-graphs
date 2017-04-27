-- http://sccode.org/1-W (jj)

import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Lang.Pattern.Plain as P {- hsc3-lang -}

bp140u :: UGen
bp140u =
    let f z n = n * (3 ** (rand z 0 17 / 13))
        e = envGen AR 1 0.3 0 1 RemoveSynth (envPerc 0.01 1)
        o = pmOsc AR (f 'α' (mce2 438 442)) (f 'β' 880) (f 'γ' e) 0
    in o * e

bp140 :: Synthdef
bp140 = synthdef "bp140" (out 0 bp140u)

main :: IO ()
main = nrt_audition (P.sbind1 (bp140,[("dur",P.rand 'δ' [1/6,1/3])]))
