-- stepper ; with bufRd for sequencing
let compose = foldl (flip (.)) id
    rvbId z0 s =
      let f z1 i =
            let dly = mce [randId ((z0,z1),'α') 0 0.5
                          ,randId ((z0,z1),'β') 0 0.5]
            in allpassN i 0.05 dly (randId z1 1.5 2)
      in compose (map f (id_seq 5 'γ')) s
    rate = mouseX kr 1.75 2.25 Exponential 0.1
    clock = impulse kr rate 0
    envl = decay2 clock 0.002 2.5
    indx = stepper clock 0 0 15 1 0
    freq_l = [97.999,195.998,523.251,466.164,195.998
             ,233.082,87.307,391.995,87.307,261.626
             ,195.998,77.782,233.082,195.998,97.999
             ,155.563]
    freq_b = asLocalBufId 'a' freq_l
    freq = bufRdN 1 kr freq_b indx Loop
    ffreq = lag2 freq 0.1 + mce [0,0.3]
    lfo = sinOsc kr 0.2 (mce [0,pi/2]) * 0.0024 + 0.0025
    top = mix (lfPulse ar (freq * mce [1,1.5,2]) 0 0.3)
    chn = [\s -> rlpf s ffreq 0.3 * envl
          ,\s -> rlpf s ffreq 0.3 * envl
          ,\s -> s * 0.5
          ,\s -> combL s 1 (0.66 / rate) 2 * 0.8 + s
          ,\s -> s + (rvbId 'γ' s * 0.3)
          ,\s -> leakDC s 0.1
          ,\s -> delayL s 0.1 lfo + s
          ,\s -> onePole s 0.9]
in compose chn top
