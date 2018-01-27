-- nharm-p (rd)

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.UGen.Bindings.DB.RDU as RDU {- sc3-rdu -}
import qualified Sound.SC3.Lang.Pattern.Plain as P {- hsc3-lang -}

nharm :: Num n => Int -> n -> [n]
nharm n f = map ((* f) . fromIntegral) [1..n]

klg :: Int -> UGen
klg n =
    let f = control KR "freq" 440
        d = rand 'α' 9 12
        l = mceChannels (RDU.randN n 'α' 0.01 0.02)
        p = rand 'α' (-1.0) 1.0
        a = 0.5
        e = envGen KR 1 0.9 0 1 RemoveSynth (envSine d a)
        nh = nharm n f
        s = klangSpec nh l (replicate n 0.0)
    in out 0 (pan2 (klang AR 1 0 s) p e)

type Range = (Double,Double)

{- Note that the dur key is used only to schedule the nodes, the UGen
graph manages duration internally. -}

pN :: Int -> Range -> Range -> (Synthdef,P.Param)
pN n (m0,m1) (d0,d1) =
    let s = synthdef ("klg" ++ show n) (klg n)
    in (s,[("freq",map midiCPS (P.white 'α' m0 m1))
          ,("dur",P.white 'β' d0 d1)])

sc :: NRT
sc = P.sbind [(pN 24 (90,92) (0.25,0.75))
             ,(pN 54 (12,14) (1.25,1.76))]

main :: IO ()
main = nrt_audition sc
