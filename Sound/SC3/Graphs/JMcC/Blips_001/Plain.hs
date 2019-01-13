module Sound.SC3.Graphs.JMcC.Blips_001.Plain where

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Common.Base {- hsc3 -}
import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}

-- * blips 001 (jmcc) #SC3d1.5

blip_001 :: ID a => a -> UGen
blip_001 z =
    let f = xLine KR (expRand (z,'α') 0.25 400) (expRand (z,'β') 0.25 400) 4 DoNothing
        nh = xLine KR (expRand (z,'γ') 2 100) (expRand (z,'δ') 2 100) 4 DoNothing
    in blip AR f nh

-- > putStrLn$ synthstat blips_001
blips_001 :: UGen
blips_001 =
    let c = rand 'ε' 0 1 <** 0.8
        o = blip_001 'ζ' * blip_001 'η'
    in c * pan2 o (line KR (rand2 'θ' 1) (rand2 'ι' 1) 4 DoNothing) 0.3

-- > putStrLn$ synthstat (blips_001_pp blips_001)
blips_001_pp :: UGen -> UGen
blips_001_pp =
    let f z x = allpassN x 0.05 (mce2 (rand (z,'κ') 0 0.05) (rand (z,'λ') 0 0.05)) 4
    in compose_l (map f (id_seq 6 'μ')) . distort

blips_001_ot :: IO ()
blips_001_ot = O.overlapTextureU_pp (2,1,12,maxBound) blips_001 2 blips_001_pp
