-- event ; p=freq z=amp
let f _ (g,_,_,z,_,_,_,p,_,_) = sinOsc ar (midiCPS (p + 12)) 0 * g * z
in mix (eventVoicer 16 f) * control kr "gain" 1.0
