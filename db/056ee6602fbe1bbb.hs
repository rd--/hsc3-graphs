-- modal space (jmcc) #8 ; event control ; modeless
let f (_,g,_,y,z,_,_,_,p,_,_) =
      let ms1 n r =
            let o = sinOsc ar (midiCps (p * 127 + r + n * y * 0.08)) 0 * 0.1
                t = lfPulse ar (midiCps (mce2 48 55)) 0 0.15
                d = rlpf t (midiCps (sinOsc kr 0.1 0 * 10 + r)) 0.1 * 0.1
                m = o + d
            in combN m 0.31 0.31 2 + m
          ms = ms1 (lfNoise1 kr 3) 0 + ms1 (lfNoise1 kr 3) 24
      in ms * z * lagUD g (y * 0.05 + 0.01) (y * 2 + 1)
in mix (eventVoicer 16 f) * control kr "gain" 1
