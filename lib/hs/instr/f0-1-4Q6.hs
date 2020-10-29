-- http://sccode.org/1-4Q6 (f0)

import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Lang.Pattern.Plain as P {- hsc3-lang -}

{-

> audition risset

> import Sound.OSC {- hosc -}
> let set p = withSC3 (sendMessage (n_set (-1) p))
> set [("trig",1)]
> set [("freq",midiCPS 100),("sustain",3),("trig",1)]
> set [("freq",midiCPS 60),("sustain",9),("trig",1)]
> set [("freq",midiCPS 40),("sustain",15),("trig",1)]

-}
risset :: UGen
risset =
    let k = control KR
        pan = k "pan" 0
        f = k "freq" 400
        ampl = k "amp" 0.05
        d = k "sustain" 2
        tr = tr_control "trig" 1
        normalise x = map (/ (maximum x)) x
        amps = normalise [1,0.67,1,1.8,2.67,1.67,1.46,1.33,1.33,1,1.33]
        durs = [1,0.9,0.65,0.55,0.325,0.35,0.25,0.2,0.15,0.1,0.075]
        frqs = [0.56,0.56,0.92,0.92,1.19,1.7,2,2.74,3,3.76,4.07]
        dets = [0,1,0,1.7,0,0,0,0,0,0,0]
        fn i =
            let shp = let c = EnvNum (-4.5)
                      in envPerc_c 0.005 (d * durs!!i) (amps!!i) (c,c)
                env = envGen AR tr 1 0 1 DoNothing shp
            in sinOsc AR (f * frqs!!i + dets!!i) 0 * ampl * env
        src = mixFill 11 fn
    in pan2 src pan 1

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
        ,("amp",P.white 'δ' 0.0025 0.015)
        ,("trig",repeat 1)])

main :: IO ()
main = nrt_audition (P.nbind1 risset_p)
