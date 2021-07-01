-- dwgBowedTor ; event control
let f _c (g,_,y,z,o,rx,ry,p,_,_) =
      let freq = midiCPS p
          s1 = X.dwgBowedTor ar freq z (0.5 + rx) 1 y 0.1 0.25 31 (0.55 + ry) 2 (5.2 + z) 1 3000 1.8 * g * z
          s2 = X.dwgSoundBoard s1 20 20 0.8 199 211 223 227 229 233 239 241
          s3 = bpf s2 118 1 + s2
          s4 = bpf s3 430 1 + s3
          s5 = bpf s4 490 1 + s4
          s6 = lpf s5 6000
      in pan2 s6 (o * 2 - 1) 1
in mix (eventVoicer 16 f) * control kr "gain" 0.25
