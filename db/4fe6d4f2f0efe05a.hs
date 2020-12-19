-- ladspa ; caps ; # 1788 C* Wider - Stereo image synthesis
let s = soundIn 0
    x = mouseX KR (-1) 1 Linear 0.2
    y = mouseY KR 0 1 Linear 0.2
in X.ladspa 2 AR 1788 [x,y,s]
