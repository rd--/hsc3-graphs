-- modal space (jmcc) #8 ; event control ; id
let f c (g,x,y,z,_,_,_,_,_,_) =
      let ms1 n r =
            let b = asLocalBufId 'α' [0,2,3.2,5,7,9,10] {- dorian scale -}
                k = degreeToKey b (x * 25) 12 {- 12 notes per octave -}
                o = sinOsc ar (midiCps (r + k + n * y * 0.08)) 0 * 0.1
                t = lfPulse ar (midiCps (mce2 48 55)) 0 0.15
                d = rlpf t (midiCps (sinOsc kr 0.1 0 * 10 + r)) 0.1 * 0.1
                m = o + d
            in combN m 0.31 0.31 2 + m
          ms = ms1 (lfNoise1Id (c,'β') kr 3) 48 + ms1 (lfNoise1Id (c,'γ') kr 3) 72
      in ms * z * lagUD g 0.2 2
in mix (eventVoicer 16 f) * control kr "gain" 1
