-- vOsc3 ; mouse selects buffer and set amplitude ; see vOsc help for setup
let n = 8
    b = control kr "tbl" 0
    x = mouseX kr b (b + n - 1) Linear 0.1
    y = mouseY kr 0.01 0.2 Exponential 0.2
    o1 = vOsc3 ar x 120 121 129
    o2 = vOsc3 ar x 119 123 127
in mce2 o1 o2 * y
