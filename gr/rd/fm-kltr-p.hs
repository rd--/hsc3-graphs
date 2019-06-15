-- fm-kltr-p (rd)

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Lang.Pattern.Plain as P {- hsc3-lang -}

fm_kltr :: UGen
fm_kltr =
  let r1 = rand 'α' 0.975 1.025
      r2 = rand 'β' 0.5 1.5
      r3 = rand 'γ' 0.975 1.025
      r4 = rand 'δ' 0.75 1.25
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
  in out o (pan2 (sinOsc AR m 0) l e)

pattern :: P.Param
pattern =
    [("freq",repeat (midiCPS 53))
    ,("freq2",map midiCPS (P.white 'α' 48 96))
    ,("amp",P.white 'β' 0.1 0.4)
    ,("dur",P.white 'γ' 0.15 1.25)
    ,("sustain",P.white 'δ' 5 6)
    ,("index",P.white 'ε' 240 1480)
    ,("pan",P.white 'ζ' (-1) 1)]

main :: IO ()
main = nrt_audition (P.sbind1 (synthdef "fm_kltr" fm_kltr,pattern))
