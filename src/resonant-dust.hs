-- resonant dust (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Events.OverlapTexture

resonant_dust :: UGen
resonant_dust =
    let rf = let st = rand 'a' 80 2080
                 en = st + (rand 'b' (-0.5) 0.5 * st)
             in xLine KR st en 9 DoNothing
        d = dust 'c' AR (rand 'd' 50 850) * 0.3
    in pan2 (resonz d rf 0.1) (rand 'e' (-1) 1) 1

main :: IO ()
main = overlapTextureU (2,5,9,maxBound) resonant_dust
