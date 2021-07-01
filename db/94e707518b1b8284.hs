-- ladspa ; caps ; # 1772 C* Compress - Compressor and saturating limiter
let s = soundIn 0
    x = roundE (mouseX kr 0 2 Linear 0.2)
    y = mouseY kr 0 1 Linear 0.2
in X.ladspa 1 ar 1772 [0.5,x,y,0.5,0.5,0.1,0,s]
