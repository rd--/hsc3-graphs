-- resonant dust (jmcc) #2

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

resonant_dust :: UGen
resonant_dust =
    let rf = let st = rand 'α' 80 2080
                 en = st + (rand 'β' (-0.5) 0.5 * st)
             in xLine KR st en 9 DoNothing
        d = dust 'γ' AR (rand 'δ' 50 850) * 0.3
    in pan2 (resonz d rf 0.1) (rand 'ε' (-1) 1) 1

main :: IO ()
main = overlapTextureU (5,2,9,maxBound) resonant_dust
