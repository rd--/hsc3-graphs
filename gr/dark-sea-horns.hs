-- http://sccode.org/1-j#c51 (jl)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.UGen.Protect
import Sound.SC3.UGen.External.RDU.ID {- sc3-rdu -}

dark_sea_horns :: UGen
dark_sea_horns =
    let n = lfNoise1
        x = localIn 2 AR
        a = tanh (sinOsc AR 65 (x * n 'α' AR 0.1 * 3) * n 'β' AR 3 * 6)
        f i = allpassN i 0.3 (randN 2 'γ' 0.1 0.3) 5
        o = tanh (useq 'δ' 9 f a)
    in mrg2 o (localOut o)

main :: IO ()
main = audition (out 0 dark_sea_horns)
