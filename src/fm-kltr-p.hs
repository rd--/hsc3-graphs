-- fm-kltr-p (rd)

import Sound.SC3.Lang.Pattern.ID
import Sound.SC3.ID

fm_kltr :: UGen
fm_kltr =
  let r1 = rand 'a' 0.975 1.025
      r2 = rand 'b' 0.5 1.5
      r3 = rand 'c' 0.975 1.025
      r4 = rand 'd' 0.75 1.25
      o = control IR "out" 0
      a = control KR "amp" 0.1
      dt = control KR "sustain" 0.1
      f = control KR "freq" 400.0
      i = control KR "index" 40.0
      p = control KR "pan" 0.0
      f2 = control KR "freq2" 600
      ep = envPerc 0.01 dt
      e = envGen AR 1 a 0 1 RemoveSynth ep
      so = sinOsc AR (xLine KR f (f * r1) dt DoNothing) 0
      xl = xLine KR f2 (f2 * r3) dt DoNothing
      m = so * line KR i (f * r2) dt DoNothing + xl
      l = line KR p (p * r4) dt DoNothing
  in pan2 (sinOsc AR m 0) l e

main :: IO ()
main = do
  let s = synthdef "fm_kltr" (out 0 fm_kltr)
      p = pbind [("freq",fmap midiCPS 53)
                ,("freq2",fmap midiCPS (pwhitei 'a' 48 96 inf +
                                        pwhite 'b' (-1) 1 inf))
                ,("amp",pwhite 'c' 0.1 0.4 inf)
                ,("dur",pwhite 'd' 0.15 1.25 inf)
                ,("sustain",pwhite 'e' 5 6 inf)
                ,("index",pwhite 'f' 240 1480 inf)
                ,("pan", pwhite 'g' (-1) 1 inf)]
  audition (s,p)
