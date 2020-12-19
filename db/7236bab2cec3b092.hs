-- ladspa ; caps ; # 1779 C* Plate - Versatile plate reverb
let s = soundIn 0
    x = mouseX KR 0 1 Linear 0.2
    y = mouseY KR 0 1 Linear 0.2
in X.ladspa 2 AR 1779 [x,y,0.5,0.5,s]
