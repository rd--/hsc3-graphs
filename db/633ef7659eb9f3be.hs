-- ladspa ; caps ; # 1788 C* Wider - Stereo image synthesis
let s = soundIn 0
    x = mouseX kr (-1) 1 Linear 0.2
    y = mouseY kr 0 1 Linear 0.2
in X.ladspa 2 ar 1788 [x,y,s]
