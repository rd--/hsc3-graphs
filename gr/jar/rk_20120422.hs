-- rukano; Apr 22, 2012; Re: Epic Pads (jar)

import Sound.SC3 {- hsc3 -}

rk_20120422 :: UGen
rk_20120422 =
  let freq_f z = midiCPS (lchoose z [60,64,65,67]) * (lfNoise2 z KR 1 * 0.011 + 1)
      freq = mce (map freq_f (take 24 ['α'..]))
      gen = lfSaw AR freq 0 * 0.1
      fmod = range 1 (mouseX KR 2 16 Linear 0.2) (lfCub KR (1/12) 0) -- modulate filter with mouse
      rqmod = range 0.1 1.0 (lfNoise2 'β' KR (1/8))
      snd = rlpf gen (freq * fmod) rqmod
  in splay snd 1 1 0 True
