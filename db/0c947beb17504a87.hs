-- event ; x=freq y=pan z=amp ; 0-1 = partial range ; 24ET
let f _ (g,x,y,z,_,_,_,_,_,_) =
      pan2 (sinOsc ar (midiCPS ((x * 12 + 48) `roundTo` 0.5)) 0) (y * 2 - 1) (z * g)
in mix (eventVoicer 16 f) * control kr "gain" 0.5
