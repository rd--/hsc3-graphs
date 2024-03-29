-- pmOsc ; event control
let f (_,g,x,y,z,_,_,_,_,_,_) =
      let cps = midiCps (x * 24 + 42)
          cps' = vibratoId 'θ' ar (k2a cps) (y * 4 + 4) 0.02 0 0 0.04 0.1 0.0 0.0
          sig = pmOsc ar cps'
                (urange 1.01 2.01 (lfPulse kr (1/8) 0 0.5) * cps)
                (envGen kr g 1 0 1 DoNothing (envelope [3,3,0] [0, 0.2] [EnvNum (-4)]))
                0
          c = ampCompA kr cps 0 0.32 1
      in sig * c * z * g
    rvb s = xFade2 s (gVerb (bpf s (midiCps 90) 1) 50 8 0.5 0.5 15 0 0.7 0.5 300) 0.2 1
in rvb (mix (voicer 16 f)) * control kr "gain" 1
