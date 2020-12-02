-- lfGauss ; several frequencies and widths combined
let x = mouseX KR 1 0.07 Exponential 0.2
    y = mouseY KR 1 3 Linear 0.2
    g = lfGauss AR x (y ** mce [-1,-2 .. -6]) 0 Loop DoNothing
    o = sinOsc AR (200 * (1.3 ** mce [0..5])) 0
in mix (g * o) * 0.1
