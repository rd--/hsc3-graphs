-- berlin 1977 (jmcc) #4 ; event-control
let f _ (g,_,y,z,_,_,_,p,_,_) =
      let freq = midiCps p
          env = decay2 (trig g controlDur) (0.05 * y) (2 * y)
          amp = env * z + 0.02
          filt = env * (fSinOsc kr 0.17 0 * 800) + 1400 {- filter frequency -}
          pw = sinOsc kr 0.08 (mce2 0 (0.5 * pi)) * 0.45 + 0.5 {- pulse width LFO(s) -}
          s = pulse ar freq pw * amp
      in combN (rlpf s filt 0.15) 0.2 (mce2 0.2 0.17) 1.5 * lagUD g 0 (2 + y)
in mix (eventVoicer 16 f) * control kr "gain" 1
