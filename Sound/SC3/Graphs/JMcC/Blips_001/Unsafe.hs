-- blips 001 (jmcc) #SC3d1.5
module Sound.SC3.Graphs.JMcC.Blips_001.Unsafe where

import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.UGen.Unsafe as U {- hsc3-unsafe -}
import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}

u_rand2 :: UGen -> UGen
u_rand2 n = U.rand (-n) n

-- ghci 7.6.3 doesn't see through this...
blip_001 :: t -> UGen
blip_001 _ =
    let f = xLine KR (U.expRand 0.25 400) (U.expRand 0.25 400) 4 DoNothing
        nh = xLine KR (U.expRand 2 100) (U.expRand 2 100) 4 DoNothing
    in blip AR f nh

-- > putStrLn$ synthstat blips_001
blips_001 :: UGen
blips_001 =
    let c = U.rand 0 1 `less_than` 0.8
        o = blip_001 'α' * blip_001 'β'
    in (c * pan2 o (line KR (u_rand2 1) (u_rand2 1) 4 DoNothing) 0.3)

iter :: (Num a, Ord a) => (t -> t) -> a -> t -> t
iter f n st = if n > 0 then iter f (n - 1) (f st) else st

-- > putStrLn$ synthstat (blips_001_pp blips_001)
blips_001_pp :: UGen -> UGen
blips_001_pp =
    let f x = allpassN x 0.05 (mce2 (U.rand 0 0.05) (U.rand 0 0.05)) 4
    in iter f (6::Int) . distort

blips_001_ot :: IO ()
blips_001_ot = O.overlapTextureU_pp (2,1,12,maxBound) blips_001 2 blips_001_pp
