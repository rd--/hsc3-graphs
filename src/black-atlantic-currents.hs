-- http://www.listarc.bham.ac.uk/lists/sc-users/msg08240.html

import Sound.SC3.ID

main :: IO ()
main =
  let n f = mce . map (\z -> lfdNoise3 z KR f)
      i = inFeedback 2
      x = out 64 (mceReverse (sinOsc AR (60 * 2) (i 65 * n 1 "ab")))
      y = out 65 (sinOsc AR (50 * 2) (i 64 * n 0.3 "cd" * 4))
  in audition (mrg [y,x,out 0 (inFeedback 2 64)])

{-
Ndef(\x, { SinOsc.ar(60 * 2, Ndef.ar(\y) * LFDNoise3.kr(1.dup)).reverse });
Ndef(\y, { SinOsc.ar(50 * 2, Ndef.ar(\x) * LFDNoise3.kr(0.3.dup) * 4) });
Ndef(\x).play;
-}

