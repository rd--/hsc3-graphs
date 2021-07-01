-- event ; p=freq y=pan z=amp ; 0-1 = partial range ; 24ET
let f _ (g,_,y,z,_,_,_,p,_,_) =
      pan2 (sinOsc ar (midiCPS p) 0) (y * 2 - 1) (z * g)
in mix (eventVoicer 16 f) * control kr "gain" 0.5
