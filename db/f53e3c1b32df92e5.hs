-- lcm
let x = mouseX kr (-20) 20 Linear 0.2
    y = mouseY kr (-20) 20 Linear 0.2
in sinOsc ar ((sinOsc kr 0.3 0 * 20) `lcmE` mce2 x y * 30 + 500) 0 * 0.1
