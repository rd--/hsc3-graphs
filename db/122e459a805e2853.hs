-- modal space (jmcc) #8 ; event control ; modeless
let f c (g,_,y,z,_,_,_,p) =
      let ms1 n r =
            let o = sinOsc AR (midiCPS (p + r + n * y * 0.08)) 0 * 0.1
                t = lfPulse AR (midiCPS (mce2 48 55)) 0 0.15
                d = rlpf t (midiCPS (sinOsc KR 0.1 0 * 10 + r)) 0.1 * 0.1
                m = o + d
            in combN m 0.31 0.31 2 + m
          ms = ms1 (lfNoise1 (c,'β') KR 3) 0 + ms1 (lfNoise1 (c,'γ') KR 3) 24
      in ms * z * lagUD g (y * 0.05 + 0.01) (y * 2 + 1)
in mix (rEventVoicer 16 f) * control KR "gain" 1
