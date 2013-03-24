-- fm-kltr-p (rd)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Pattern {- hsc3-lang -}

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

pattern :: P_Bind
pattern =
    [(K_instr,psynth (synthdef "fm_kltr" fm_kltr))
    ,(K_freq,fmap midiCPS 53)
    ,(K_param "freq2",fmap midiCPS (pwhitei 'ε' 48 96 inf +
                                    pwhite 'ζ' (-1) 1 inf))
    ,(K_amp,pwhite 'η' 0.1 0.4 inf)
    ,(K_dur,pwhite 'θ' 0.15 1.25 inf)
    ,(K_sustain,pwhite 'ι' 5 6 inf)
    ,(K_param "index",pwhite 'κ' 240 1480 inf)
    ,(K_param "pan", pwhite 'λ' (-1) 1 inf)]

main :: IO ()
main = audition (pbind pattern)
