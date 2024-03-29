-- harmonicOsc ; event control
let f (_,g,x,_,z,o,_,_,_,_,_) =
      let amplitudes = X.tRandNId 16 'α' 0.01 0.1 g
      in pan2 (X.harmonicOsc ar (midiCps (x * 25 + 36)) 1 amplitudes) (o * 2 - 1) (g * z)
in mix (voicer 16 f) * control kr "gain" 0.5
