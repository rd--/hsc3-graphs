-- default (jmcc)

import Data.Default {- data-default -}
import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Pattern {- hsc3-lang -}

pattern :: P_Bind
pattern =
    [(K_instr,psynth def)
    ,(K_note,pxrand 'α' [0,1,5,7,9] inf)
    ,(K_octave,prand 'β' [3,4,5,6] inf)
    ,(K_dur,pwrand 'γ' [0.1,0.2,0.4] [0.5,0.4,0.1] inf)
    ,(K_amp,pbrown 'δ' 0.01 0.2 0.01 inf)
    ,(K_param "pan",pbrown 'ε' (-1) 1 0.25 inf)]

main :: IO ()
main = audition (pbind pattern)
