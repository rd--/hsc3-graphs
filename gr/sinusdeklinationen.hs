-- http://www.fredrikolofsson.com/f0blog/?q=node/488 (f0)

import Data.List.Split {- split -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Pattern {- hsc3-lang -}

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

pattern :: Enum e => (Field,[e]) -> [P_Bind]
pattern (c,z) =
    case z of
      [z0,z1,z2,z3] ->
          let a = pwhite z0 0 1 inf
              s = 0.2
              r = pwhite z1 0 1 inf
              i = psynth (synthdef "sinuscell" sinuscell)
          in [(K_instr,i)
             ,(K_dur,a+s+r)
             ,(K_amp,pwhite z3 0 1 inf)
             ,(K_param "fre",pwhite z2 0 1100 inf)
             ,(K_param "atk",a)
             ,(K_param "sus",s)
             ,(K_param "rel",r)
             ,(K_param "pan",prepeat c)]
      _ -> undefined

cells :: Fractional n => [n]
cells = [-1,-0.6,-0.5,0,0.2,0.5,0.4,1]

main :: IO ()
main =
    let c = zip cells (chunksOf 4 ['α'..])
    in paudition (ppar (map (pbind . pattern) c))
