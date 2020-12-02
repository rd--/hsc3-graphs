-- formlet ; and again (control-rate)
let s = dust 'α' KR (mce2 10 11)
    x = mouseX KR 0.1 2 Exponential 0.2
    y = mouseY KR 7 200 Exponential 0.2
    f = formlet s y 0.005 x
in k2a f + sinOsc AR (f * 200 + mce2 500 600 - 100) 0 * 0.1
