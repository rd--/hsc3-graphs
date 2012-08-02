-- resonant dust (jmcc)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

resonant_dust :: UGen
resonant_dust =
    let rf = let st = rand 'α' 80 2080
                 en = st + (rand 'α' (-0.5) 0.5 * st)
             in xLine KR st en 9 DoNothing
        d = dust 'α' AR (rand 'α' 50 850) * 0.3
    in pan2 (resonz d rf 0.1) (rand 'α' (-1) 1) 1

main :: IO ()
main = overlapTextureU (5,2,9,maxBound) resonant_dust
