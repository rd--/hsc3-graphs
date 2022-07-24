-- modal space (jmcc) #8 ; local buffer
let ms n r =
      let b = asLocalBuf 1 [0, 2, 3.2, 5, 7, 9, 10] {- dorian scale -}
          x = MouseX 0 15 linear 0.1 {- mouse indexes into scale -}
          k = DegreeToKey b x 12 {- 12 notes per octave -}
          o = SinOsc (MidiCps (r + k + n * 0.04)) 0 * 0.1
          t = LFPulse (MidiCps [48,  55]) 0 0.15
          f = MidiCps (SinOsc 0.1 0 * 10 + r)
          d = RLPF t f 0.1 * 0.1
          m = o + d
      in CombN m 0.31 0.31 2 + m
in ms (LFNoise1 3) 48 + ms (LFNoise1 3) 72 * 0.25
