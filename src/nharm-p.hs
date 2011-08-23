-- nharm-p (rd)

import Sound.SC3.ID
import Sound.SC3.Lang.Collection.Event
import Sound.SC3.Lang.Pattern.List

nharm :: Num n => Int -> n -> [n]
nharm n f = map ((* f) . fromIntegral) [1..n]

nsucc :: Enum e => Int -> e -> [e]
nsucc =
    let f 0 _ = []
        f n e = e : f (n - 1) (succ e)
    in f

lrand :: (ID a, Enum a) => Int -> a -> UGen -> UGen -> [UGen]
lrand n i l r = map (\j -> rand j l r) (nsucc n i)

klg :: Int -> UGen
klg n =
    let f = control KR "freq" 440
        d = rand 'a' 9 12
        l = lrand n 'b' 0.01 0.02
        p = rand 'c' (-1.0) 1.0
        a = 0.5
        e = envGen KR 1 0.9 0 1 RemoveSynth (envSine d a)
        nh = nharm n f
        s = klangSpec nh l (replicate n 0.0)
    in out 0 (pan2 (klang AR 1 0 s) p e)

type Range = (Double,Double)

{- Note that the dur key is used only to schedule the nodes. Both it
and the gate message are ignored by the UGen graph, which manages
duration internally.  -}

pN :: Int -> Range -> Range -> P (Event Double)
pN n (m0,m1) (d0,d1) =
    let i = synthdef ("klg" ++ show n) (klg n)
        p = pbind [("midinote",pwhite 'a' m0 m1 inf)
                  ,("dur",pwhite 'b' d0 d1 inf)]
    in pinstr_d (return i) p

main :: IO ()
main = audition (pmerge (pN 24 (90,92) (0.25,0.75))
                        (pN 54 (12,14) (1.25,1.76)))
