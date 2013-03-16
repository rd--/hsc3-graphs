-- http://sccode.org/1-4Q6 (f0)

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.Instrument {- hsc3-lang -}
import Sound.SC3.Lang.Pattern.ID {- hsc3-lang -}

-- > audition risset
--
-- let set p = withSC3 (\fd -> send fd (n_set (-1) p))
-- set [("trig",1)]
-- set [("freq",midiCPS 100),("sustain",3),("trig",1)]
-- set [("freq",midiCPS 60),("sustain",9),("trig",1)]
-- set [("freq",midiCPS 40),("sustain",15),("trig",1)]
risset :: Synthdef
risset =
    let k = control KR
        pan = k "pan" 0
        freq = k "freq" 400
        ampl = k "amp" 0.1
        dur = k "sustain" 2
        tr = tr_control "trig" 1
        amps = [1,0.67,1,1.8,2.67,1.67,1.46,1.33,1.33,1,1.33]
        durs = [1,0.9,0.65,0.55,0.325,0.35,0.25,0.2,0.15,0.1,0.075]
        frqs = [0.56,0.56,0.92,0.92,1.19,1.7,2,2.74,3,3.76,4.07]
        dets = [0,1,0,1.7,0,0,0,0,0,0,0]
        fn i =
            let shp = let c = EnvNum (-4.5)
                      in envPerc' 0.005 (dur * durs!!i) (amps!!i) (c,c)
                env = envGen AR tr 1 0 1 DoNothing shp
            in sinOsc AR (freq * frqs!!i + dets!!i) 0 * ampl * env
        src = mixFill 11 fn
    in synthdef "risset" (out 0 (pan2 src pan 1))

pattern :: P_Bind Double
pattern =
  [("note",prand 'α' [0,2,5,7,11] inf)
  ,("octave",prand 'β' [4,5,6,7,9] inf)
  ,("legato",1)
  ,("dur",prand 'γ' [2,3,5,7] inf)
  ,("amp",pwhite 'δ' 0.025 0.15 inf)
  ,("trig",1)]

main :: IO ()
main = do
  let i = (InstrumentDef risset False)
  audition (pmono i 1000 pattern)
