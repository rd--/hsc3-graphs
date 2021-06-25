-- sos
let f _ (w,x,y,z,o,_,_,_,_,_) =
      let freq = midiCPS (x * 25 + 48)
          rq = 0.002 + (y * 0.004)
          b1 = 1.987 * 0.9889999999 * cos 0.09
          b2 = -0.998057
          im = decay (trig1 (k2a w) sampleDur) 0.1
          s1 = sos im 0.3 0.0 0.0 b1 b2
          s2 = rhpf (s1 * 0.8) freq rq
          s3 = s2 + delayC (rhpf (s1 * 0.9) (freq * 0.99999) (rq * 0.999)) 0.02 0.01223
          s4 = decay2 s3 0.4 0.3 * s2
      in pan2 s4 (o * 2 - 1) 0.1
in mix (eventVoicer 16 f) * control KR "gain" 0.5
