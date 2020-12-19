-- ladspa ; caps ; # 1769 C* Click - Metronome
let x = roundE (mouseX KR 0 3 Linear 0.2)
    y = mouseY KR 4 240 Linear 0.2
in X.ladspa 1 AR 1769 [x,y,0.5,0.5]
