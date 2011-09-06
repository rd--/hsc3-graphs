-- nharm-p (rd)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.Event
import Sound.SC3.Lang.Pattern.ID

nharm :: Num n => Int -> n -> [n]
nharm n f = map ((* f) . fromIntegral) [1..n]

klg :: Int -> UGen
klg n =
    let f = control KR "freq" 440
        d = rand 'a' 9 12
        l = uclone' 'a' n (rand 'a' 0.01 0.02)
        p = rand 'a' (-1.0) 1.0
        a = 0.5
        e = envGen KR 1 0.9 0 1 RemoveSynth (envSine d a)
        nh = nharm n f
        s = klangSpec nh l (replicate n 0.0)
    in out 0 (pan2 (klang AR 1 0 s) p e)

type Range = (Double,Double)

{- Note that the dur key is used only to schedule the nodes. Both it
and the gate message are ignored by the UGen graph, which manages
duration internally.  -}

pN :: Int -> Range -> Range -> P Event
pN n (m0,m1) (d0,d1) =
    let i = synthdef ("klg" ++ show n) (klg n)
        p = pbind [("midinote",pwhite 'a' m0 m1 inf)
                  ,("dur",pwhite 'b' d0 d1 inf)]
    in pinstr_d (return i) p

main :: IO ()
main = audition (pmerge (pN 24 (90,92) (0.25,0.75))
                        (pN 54 (12,14) (1.25,1.76)))
