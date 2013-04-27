-- http://www.listarc.bham.ac.uk/lists/sc-users/msg07473.html (nc)

import Control.Monad {- base -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Pattern {- hsc3-lang -}

analogarpeggio :: Synthdef
analogarpeggio =
    let k = control KR
        o = k "out" 0
        p = k "pan" 0
        g = k "gate" 1
        f = k "freq" 440
        a = k "amp" 0.1
        c = k "cutoffmult" 3
        r = k "res" 0.1
        e = let d = envADSR 0.01 0.3 0.5 1 1 (EnvNum (-4)) 0
            in envGen AR g 1 0 1 RemoveSynth d
        i = mix (saw AR (f * mce [0.497,0.999,1.0,2.03]))
        s = bLowPass i (c * f) r * 0.25
    in synthdef "analogarpeggio" (out o (pan2 (e * s * a) p 0.25))

{-
audition (pbind [(K_instr,psynth analogarpeggio)
                ,(K_dur,pstutter 8 (pwrand 'α' [0.1,0.25] [2/3,1/3] inf))
                ,(K_note,pwrand 'β' [0,2,4,5,7] [0.3,0.1,0.3,0.1,0.2] inf)
                ,(K_octave,pstutter 4 (prand 'γ' [4,5,6,7] inf))
                ,(K_param "pan",pbrown 'δ' (-1.0) 1.0 0.25 inf)
                ,(K_amp,pbrown 'ε' 0.1 0.5 0.15 inf)
                ,(K_param "cutoffmult",pbrown 'ζ' 4.0 5.0 0.1 inf)
                ,(K_param "res",pbrown 'η' 0.0 1.0 0.25 inf)])
-}

-- > pinterp 3 0 9 == toP' [0,3,6]
-- > pseries 6 ((15 - 3) / 6) 3 == toP' [6,8,10]
pinterp :: (Fractional a) => Int -> a -> a -> P a
pinterp n s e = pseries s ((e - s) / fromIntegral n) n

pinterp' :: (Fractional a) => P Int -> P a -> P a -> P a
pinterp' n s e = join (pzipWith3 pinterp n s e)

arpeggio :: [P_Bind]
arpeggio =
    [(K_instr,psynth analogarpeggio)
    ,(K_dur
     ,let d = pwrand 'α' [0.25,0.125,0.0625] [0.4875,0.4875,0.025] inf
      in pstutter 32 d)
    ,(K_param "cutoffmult"
     ,let n = prand 'β' [8,16,24,32] inf
          s = pwhite 'γ' 2.5 5.0 inf
          e = pwhite 'δ' 1.5 7.0 inf
      in pinterp' n s e)
    ,(K_param "res"
     ,let n = prand 'ε' [8,16,24,32] inf
          s = pexprand 'ζ' 0.02 0.5 inf
          e = pexprand 'η' 0.02 1.0 inf
      in pinterp' n s e)
    ,(K_param "pan"
     ,let n = prand 'θ' [8,16] inf
          s = pwhite 'ι' (-1.0) 1.0 inf
          s' = fmap (< 0) s
          e = pif s' (pwhite 'κ' 0.0 1.0 inf) (pwhite 'λ' (-1.0) 0.0 inf)
      in pinterp' n s e)
    ,(K_amp
     ,let n = prand 'μ' [8,16,24,32] inf
          s = prand 'ν' [0.25,0.05,0.5] inf
          e = prand 'ξ' [0.25,0.05,0.5,0.01] inf
      in pinterp' n s e)
    ,(K_note
     ,let f x = pn (toP x) 8
      in pseq (map f [[10,6,1,-2]
                     ,[-3,1,6,9]
                     ,[9,6,1,-3]
                     ,[-2,1,6,10]
                     ,[8,6,1,-4]
                     ,[-3,1,6,9]
                     ,[8,6,1,-3]
                     ,[-6,1,6,8]]) inf)
    ,(K_octave
     ,pstutter 8 (pseq [7,6,5,4,4,5,6,7] inf))]

main :: IO ()
main = do
  let n = 60/157
      p = pedit K_dur (* n) (pbind arpeggio)
  withSC3 (play p)
