-- nharm-p

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.UGen.External.RDU {- sc3-rdu -}
import Sound.SC3.Lang.Control.Event {- hsc3-lang -}
import Sound.SC3.Lang.Pattern.ID

nharm :: Num n => Int -> n -> [n]
nharm n f = map ((* f) . fromIntegral) [1..n]

klg :: Int -> UGen
klg n =
    let f = control KR "freq" 440
        d = rand 'α' 9 12
        l = mceChannels (randN n 'α' 0.01 0.02)
        p = rand 'α' (-1.0) 1.0
        a = 0.5
        e = envGen KR 1 0.9 0 1 RemoveSynth (envSine d a)
        nh = nharm n f
        s = klangSpec nh l (replicate n 0.0)
    in out 0 (pan2 (klang AR 1 0 s) p e)

type Range = (Double,Double)

{- Note that the dur key is used only to schedule the nodes. Both it,
and any gate message, are ignored by the UGen graph, which manages
duration internally.  -}

pN :: Int -> Range -> Range -> P Event
pN n (m0,m1) (d0,d1) =
    let i = synthdef ("klg" ++ show n) (klg n)
        p = pbind [("midinote",pwhite 'α' m0 m1 inf)
                  ,("dur",pwhite 'β' d0 d1 inf)]
    in pinstr_d (return (i,False)) p

main :: IO ()
main = audition (pmerge (pN 24 (90,92) (0.25,0.75))
                        (pN 54 (12,14) (1.25,1.76)))
