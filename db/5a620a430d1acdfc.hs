-- excess ; written out in terms of clip2
let o = fSinOsc ar 1000 0
    l = line kr 0 1 8 DoNothing
in (o - clip2 o l) * 0.1
