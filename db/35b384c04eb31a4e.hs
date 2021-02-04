-- berlin 1977 (jmcc) #4 ; event-control
let f c (g,x,y,z,_,_,_,p) =
      let freq = midiCPS p
          env = decay2 (trig g controlDur) (0.05 * y) (2 * y)
          amp = env * z + 0.02
          filt = env * (fSinOsc KR 0.17 0 * 800) + 1400 {- filter frequency -}
          pw = sinOsc KR 0.08 (mce2 0 (0.5 * pi)) * 0.45 + 0.5 {- pulse width LFO(s) -}
          s = pulse AR freq pw * amp
      in combN (rlpf s filt 0.15) 0.2 (mce2 0.2 0.17) 1.5 * lagUD g 0 (2 + y)
in mix (rEventVoicer 16 f) * control KR "gain" 1
