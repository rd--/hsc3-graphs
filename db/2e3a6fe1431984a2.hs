-- ladspa ; caps ; # 1779 C* Plate - Versatile plate reverb
let s = soundIn 0
    x = mouseX kr 0 1 Linear 0.2
    y = mouseY kr 0 1 Linear 0.2
in X.ladspa 2 ar 1779 [x,y,0.5,0.5,s]
