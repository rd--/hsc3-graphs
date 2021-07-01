-- formlet ; and again (control-rate)
let s = dustId 'α' kr (mce2 10 11)
    x = mouseX kr 0.1 2 Exponential 0.2
    y = mouseY kr 7 200 Exponential 0.2
    f = formlet s y 0.005 x
in k2a f + sinOsc ar (f * 200 + mce2 500 600 - 100) 0 * 0.1
