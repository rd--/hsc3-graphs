-- vOsc ; oscillator at eight consecutive wavetable buffers, mouse selects ; requires=tbl
let n = 8
    b = control KR "tbl" 0
    x = mouseX KR b (b + n - 1) Linear 0.1
    y = mouseY KR 0.01 0.2 Exponential 0.2
in vOsc AR x (mce [120, 121]) 0 * y
