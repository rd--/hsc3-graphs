-- modal space (jmcc) #8 ; event control ; modeless ; id
let f c (g,_,y,z,_,_,_,p,_,_) =
      let ms1 n r =
            let o = sinOsc ar (midiCPS (p + r + n * y * 0.08)) 0 * 0.1
                t = lfPulse ar (midiCPS (mce2 48 55)) 0 0.15
                d = rlpf t (midiCPS (sinOsc kr 0.1 0 * 10 + r)) 0.1 * 0.1
                m = o + d
            in combN m 0.31 0.31 2 + m
          ms = ms1 (lfNoise1Id (c,'β') kr 3) 0 + ms1 (lfNoise1Id (c,'γ') kr 3) 24
      in ms * z * lagUD g (y * 0.05 + 0.01) (y * 2 + 1)
in mix (eventVoicer 16 f) * control kr "gain" 1