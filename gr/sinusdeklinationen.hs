-- http://www.fredrikolofsson.com/f0blog/?q=node/488 (f0)

import Data.List.Split {- split -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Monad.Syntax {- hsc3 -}
import qualified Sound.SC3.Lang.Pattern.Plain as P {- hsc3-lang -}

sinuscell :: UGen
sinuscell =
    let ctl = control KR
        b = ctl "out" 0
        p = ctl "pan" 0
        a = ctl "amp" 0.5
        fre = ctl "fre" 400
        atk = ctl "atk" 1
        sus = ctl "sus" 0.2
        rel = ctl "rel" 1
        e_d = envLinen atk sus rel a
        e = envGen KR 1 0.1 0 1 RemoveSynth e_d
        s = sinOsc AR fre 0
    in out b (pan2 s p e)

pattern :: Enum e => (Double,[e]) -> (Synthdef,P.Param)
pattern (c,z) =
    case z of
      [z0,z1,z2,z3] ->
          let a = P.white z0 0 1
              s = repeat 0.2
              r = P.white z1 0 1
              i = synthdef "sinuscell" sinuscell
          in (i
             ,[("dur",a .+. s .+. r)
              ,("amp",P.white z3 0 1)
              ,("fre",P.white z2 0 1100)
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
