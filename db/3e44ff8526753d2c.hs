-- impulse
let f = mouseY KR 4 8 Linear 0.1
    x = mouseX KR 0 1 Linear 0.1
in impulse AR f (mce [0,x]) * 0.1
