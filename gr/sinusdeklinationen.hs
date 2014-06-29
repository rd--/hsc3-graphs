-- http://www.fredrikolofsson.com/f0blog/?q=node/488 (f0)
{-# OPTIONS_GHC -F -pgmF hsc3-psynth #-}

import Data.List.Split {- split -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Collection.Numerical.Truncating () {- hsc3-lang -}
import qualified Sound.SC3.Lang.Pattern.Plain as P {- hsc3-lang -}

sinuscell :: Synthdef
sinuscell = psynth {bus=0,pan=0,amp=0.5,freq=400,atk=1,sus=0.2,rel=1} where
    let e_d = envLinen atk sus rel amp
        e = envGen KR 1 0.1 0 1 RemoveSynth e_d
        s = sinOsc AR freq 0
    in out bus (pan2 s pan e)

pattern :: Enum e => (Double,[e]) -> (Synthdef,P.Param)
pattern (c,z) =
    case z of
      [z0,z1,z2,z3] ->
          let a = P.white z0 0 1
              s = repeat 0.2
              r = P.white z1 0 1
          in (sinuscell
             ,[("dur",a + s + r)
              ,("amp",P.white z3 0 1)
              ,("freq",P.white z2 0 1100)
              ,("atk",a)
              ,("sus",s)
              ,("rel",r)
              ,("pan",repeat c)])
      _ -> undefined

cells :: Fractional n => [n]
cells = [-1,-0.6,-0.5,0,0.2,0.5,0.4,1]

main :: IO ()
main =
    let c = zip cells (chunksOf 4 ['α'..])
    in audition (P.sbind (map pattern c))
