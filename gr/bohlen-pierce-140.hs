-- http://sccode.org/1-W (jj)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Pattern.ID {- hsc3-lang -}

bp140u :: UGen
bp140u =
    let f z n = n * (3 ** (rand z 0 17 / 13))
        e = envGen AR 1 0.3 0 1 RemoveSynth (envPerc 0.01 1)
        o = pmOsc AR (f 'α' (mce2 438 442)) (f 'β' 880) (f 'γ' e) 0
    in o * e

bp140 :: Synthdef
bp140 = synthdef "bp140" (out 0 bp140u)

main :: IO ()
main = do
  let p = pbind [("instr",psynth bp140),("dur",prand 'δ' [1/6,1/3] inf)]
  audition p
