-- swept resonant noise (jmcc) #2 ; texture=overlap,4,5,5,inf
let flt src _ =
      let p = 10
          spec = klankSpec_mce
                 (X.rLinRandN p 80 10080 0)
                 (mce (replicate p 1))
                 (X.rRandN p 0.5 2.5)
      in klank src 1 0 1 spec
    n = whiteNoise ar * 0.007
    f = midiCps (fSinOsc kr (rand 0.1 0.3) 0 * rand 0 24 + rand 36 84)
    sw = resonz n f 0.1
in mceFill 2 (flt sw)
