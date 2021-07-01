-- impulse
let f = mouseY kr 4 8 Linear 0.1
    x = mouseX kr 0 1 Linear 0.1
in impulse ar f (mce [0,x]) * 0.1
