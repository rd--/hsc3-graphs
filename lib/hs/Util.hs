module Util where

import Sound.SC3 {- hsc3 -}

-- * UTIL

-- | 'demand' of 'dseq', somewhat akin to SC2 Sequencer.
dsequ :: ID z => z -> [UGen] -> UGen -> UGen
dsequ z s tr = demand tr 0 (dseq z dinf (mce s))

-- | 'demand' of 'dshuf' with 'dinf' repeat, ie. randomised 'dsequ'.
dsequR :: ID z => z -> [UGen] -> UGen -> UGen
dsequR z s tr = demand tr 0 (dshuf z dinf (mce s))

-- | 'demand' of 'dxrand' with 'dinf' repeat, ie. alternate randomised 'dsequ'.
dsequX :: ID z => z -> [UGen] -> UGen -> UGen
dsequX z s tr = demand tr 0 (dxrand z dinf (mce s))

-- | 'dsequ' '*' /tr/, ie. impulse sequencer.
isequ :: ID z => z -> [UGen] -> UGen -> UGen
isequ z s tr = dsequ z s tr * tr

isequX :: ID z => z -> [UGen] -> UGen -> UGen
isequX z s tr = dsequX z s tr * tr

enumFromN :: Enum a => a -> Int -> [Int]
enumFromN e i = let j = fromEnum e in [j .. j + i]

nrec :: (Num a, Ord a) => a -> (t -> t) -> t -> t
nrec n f st = if n > 0 then nrec (n - 1) f (f st) else st

