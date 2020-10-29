-- http://www.fredrikolofsson.com/f0blog/?q=node/537 (f0)

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Collection.Extension {- hsc3-lang -}
import Sound.SC3.Lang.Math {- hsc3-lang -}
import Sound.SC3.Lang.Pattern.Plain {- hsc3-lang -}

fibs :: Num n => [n]
fibs = 0 : scanl (+) 1 fibs

-- | In SC3, List.fibs begins at 1.
nfibs :: Num a => Int -> [a]
nfibs n = take n (tail fibs)

-- | In SC3, % of zero is zero.
mod0 :: (Extending f, Integral c) => f c -> f c -> f c
mod0 l = let f p q = if q == 0 then 0 else p `mod` q in zipWith_c f l

post_proc :: UGen
post_proc = let s = combL (tanh (in' 1 AR 8) / 8) 1 1 8 in mce2 s s * 0.1

pattern :: NRT
pattern =
    let d :: [Int]
        d = nfibs 32 `mod0` (nfibs 64  `mod0` [12])
        f = map (\x -> degree_to_cps [0,2,4,5,7,9,11] 12 (fromIntegral x) 4) d
    in sbind1 (defaultSynthdef
              ,[("amp",repeat 8)
               ,("dur",repeat 0.25)
               ,("freq",cycle f)
               ,("out",repeat 8)])

main :: IO ()
main = audition (out 0 post_proc) >> nrt_audition pattern
