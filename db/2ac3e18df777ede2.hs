-- vOsc ; oscillator at eight consecutive wavetable buffers, mouse selects ; requires=tbl
let n = 8
    b = control kr "tbl" 0
    x = mouseX kr b (b + n - 1) Linear 0.1
    y = mouseY kr 0.01 0.2 Exponential 0.2
in vOsc ar x (mce [120, 121]) 0 * y
