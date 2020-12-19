-- ladspa ; caps ; # 1771 C* Saturate - Various static nonlinearities, 8x oversampled
let s = soundIn 0
    x = roundE (mouseX KR 0 11 Linear 0.2)
    y = mouseY KR (-24) 72 Linear 0.2
in X.ladspa 1 AR 1771 [x,y,0.0,s]
