-- pmOsc ; event control
let f _ (g,x,y,z,_,_,_,_,_,_) =
      let cps = midiCPS (x * 24 + 42)
          sig = pmOsc AR
                (vibrato 'θ' AR (k2a cps) (y * 4 + 4) 0.02 0 0 0.04 0.1 0.0 0.0)
                (urange 1.01 2.01 (lfPulse KR (1/8) 0 0.5) * cps)
                (envGen KR g 1 0 1 DoNothing (envelope [3,3,0] [0, 0.2] [EnvNum (-4)]))
                0
      in mix (sig * ampCompA KR cps 0 0.32 1 * z * g)
    rvb s = xFade2 s (gVerb (bpf s (midiCPS 90) 1) 50 8 0.5 0.5 15 0 0.7 0.5 300) 0.2 1
in rvb (mix (rEventVoicer 16 f)) * control KR "gain" 1
