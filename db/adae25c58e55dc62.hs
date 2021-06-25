-- narrow band filtered crackle noise (jmcc) #2 ; event control
let f c (g,_,y,z,o,_,_,p,_,_) =
      let cr = crackle AR (1.97 + rand (c,'γ') 0 0.03)
      in pan2 (resonz cr (midiCPS p) (0.2 - y * 0.2)) (o * 2 - 1) (z * 10 * g)
in mix (eventVoicer 16 f) * control KR "gain" 1
