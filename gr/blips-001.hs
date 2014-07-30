-- blips 001 (jmcc) #SC3d1.5

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

rand2 :: ID a => a -> UGen -> UGen
rand2 e n = rand e (-n) n

blip_001 :: ID a => a -> UGen
blip_001 e =
    let f = xLine KR (expRand 'α' 0.25 400) (expRand 'β' 0.25 400) 4 DoNothing
        nh = xLine KR (expRand 'γ' 2 100) (expRand 'δ' 2 100) 4 DoNothing
    in uprotect e (blip AR f nh)

blips_001 :: UGen
blips_001 =
    let c = rand 'ε' 0 1 <* 0.8
        o = blip_001 'ζ' * blip_001 'η'
    in (c * pan2 o (line KR (rand2 'θ' 1) (rand2 'ι' 1) 4 DoNothing) 0.3)

-- > let g = blips_pp blips_001
-- > audition (out 0 (blips_pp blips_001))
blips_pp :: UGen -> UGen
blips_pp z =
    let z' = distort z
        f x = allpassN x 0.05 (mce2 (rand 'κ' 0 0.05) (rand 'λ' 0 0.05)) 4
    in useq 'μ' 6 f z'

main :: IO ()
main = overlapTextureU_pp (2,1,12,maxBound) blips_001 2 blips_pp
