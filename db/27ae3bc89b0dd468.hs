-- t2a ; compare with k2a (oscilloscope)
let tr = impulse KR 200 0
in lag (mce2 (t2a tr 0) (k2a tr)) 0.001
