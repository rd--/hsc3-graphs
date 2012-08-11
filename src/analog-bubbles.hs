-- analog bubbles (jmcc)

import Sound.SC3 {- hsc3 -}

-- > Sound.SC3.UGen.Dot.draw analog_bubbles
analog_bubbles :: UGen
analog_bubbles =
  let o = lfSaw KR (mce2 8 7.23) 0 * 3 + 80
      f = lfSaw KR 0.4 0 * 24 + o
      s = sinOsc AR (midiCPS f) 0 * 0.04
  in combN s 0.2 0.2 4

main :: IO ()
main = audition (out 0 analog_bubbles)
