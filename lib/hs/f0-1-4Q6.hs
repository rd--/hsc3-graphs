-- http://sccode.org/1-4Q6 (f0)

import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Lang.Pattern.Plain as P {- hsc3-lang -}

import F0

risset_s :: Synthdef
risset_s = synthdef "risset" (out 0 risset)

risset_p :: (Synthdef,Int,P.Param_MCE)
risset_p =
    let fr = let d = P.rand 'α' [0,2,5,7,11]
                 o = P.rand 'β' [4,5,6,7,9]
                 sc = [0,2,4,5,7,9,11]
             in P.degree_to_cps' sc 12 d o
        du = P.rand 'γ' [2,3,5,7]
    in (risset_s,1000
       ,[("freq",fr)
        ,("dur",du)
        ,("sustain",map (* 1.25) du)
        ,("amp",P.white 'δ' 0.025 0.15)
        ,("trig",repeat 1)])

main :: IO ()
main = nrt_audition (P.nbind1 risset_p)
