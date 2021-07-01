-- swept resonant noise (jmcc) #2 ; texture=overlap,4,5,5,inf ; id
let flt src z =
      let p = 10
          spec = klankSpec_mce
                 (X.rLinRandNId p z 80 10080 0)
                 (mce (replicate p 1))
                 (X.rRandNId p z 0.5 2.5)
      in klank src 1 0 1 spec
    n = whiteNoiseId 'α' ar * 0.007
    f = midiCPS (fSinOsc kr (randId 'β' 0.1 0.3) 0 * randId 'γ' 0 24 + randId 'δ' 36 84)
    sw = resonz n f 0.1
in mce (map (flt sw) ['ε','ζ'])
