-- default (jmcc)

import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Lang.Pattern.List as L {- hsc3-lang -}
import qualified Sound.SC3.Lang.Pattern.Plain as P {- hsc3-lang -}

pattern :: (Synthdef,P.Param)
pattern =
    let to_cps = P.degree_to_cps' [0,2,4,5,7,9,11] 12
    in (defaultSynthdef
       ,[("freq",to_cps (P.xrand 'α' [0,1,5,7,9]) (P.rand 'β' [2,3,4,5,6]))
        ,("dur",P.wrand 'γ' [0.1,0.2,0.4] [0.5,0.4,0.1])
        ,("amp",L.brown 'δ' 0.01 0.2 0.01)
        ,("pan",L.brown 'ε' (-1) 1 0.25)])

main :: IO ()
main = nrt_audition (P.sbind1 pattern)
