-- * blips 001 (jmcc) #SC3d1.5

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.UGen.Protect as Protect {- hsc3-rw -}
import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}

blip_001 :: ID a => a -> UGen
blip_001 e =
    let f = xLine KR (expRand 'α' 0.25 400) (expRand 'β' 0.25 400) 4 DoNothing
        nh = xLine KR (expRand 'γ' 2 100) (expRand 'δ' 2 100) 4 DoNothing
    in Protect.uprotect_all e (blip AR f nh)

-- > putStrLn$ synthstat blips_001
blips_001 :: UGen
blips_001 =
    let c = rand 'ε' 0 1 `less_than` 0.8
        o = blip_001 'ζ' * blip_001 'η'
    in c * pan2 o (line KR (rand2 'θ' 1) (rand2 'ι' 1) 4 DoNothing) 0.3

-- > putStrLn$ synthstat (blips_001_pp blips_001)
blips_001_pp :: UGen -> UGen
blips_001_pp z =
    let z' = distort z
        f x = allpassN x 0.05 (mce2 (rand 'κ' 0 0.05) (rand 'λ' 0 0.05)) 4
    in Protect.useq_all 'μ' 6 f z'

blips_001_ot :: IO ()
blips_001_ot = O.overlapTextureU_pp (2,1,12,maxBound) blips_001 2 blips_001_pp
