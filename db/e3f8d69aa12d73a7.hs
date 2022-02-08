-- event ; x=freq z=amp ; 0-1 = partial range ; 24ET
let f (_,g,x,_,z,_,_,_,_,_,_) = sinOsc ar (midiCps ((x * 12 + 48) `roundTo` 0.5)) 0 * z * g
in mix (eventVoicer 16 f) * control kr "gain" 0.5
