-- synthetic piano (jmcc) #3 ; event-control
let f c (g,_,y,z,_,_,_,p,_,_) =
      let e = decay2 (trig g controlDur) 0.008 (linLin y 0 1 0.02 0.06) * z * 2
          cmb k o = let n0 = lfNoise2 (c,k) AR 3000
                        dt = 1 / midiCPS (p + o)
                    in combL (n0 * e) dt dt 6
          l = ((p - 36) / 27) - 1
          cmb_ = sum_opt (zipWith cmb ['δ'..] [-0.05,0,0.04])
      in pan2 cmb_ l (1 + z)
in mix (rEventVoicer 16 f) * control KR "gain" 1
