-- narrow band filtered crackle noise (jmcc) #2 ; event control ; id
let f c (g,_,y,z,o,_,_,p,_,_) =
      let cr = crackle ar (1.97 + randId (c,'γ') 0 0.03)
      in pan2 (resonz cr (midiCps p) (0.2 - y * 0.2)) (o * 2 - 1) (z * 10 * g)
in mix (eventVoicer 16 f) * control kr "gain" 1
