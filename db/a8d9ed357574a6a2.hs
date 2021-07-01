-- membraneCircle ; X = tension and impulse frequency, Y = duration, release-time and amplitude
let x = mouseX kr 0 1 Linear 0.2
    y = mouseY kr 1e-9 1 Exponential 0.2
    loss = linLin y 0 1 0.999999 0.999
    wobble = sinOsc kr 2 0
    tension = linLin x 0 1 0.01 0.1 + (wobble * 0.0001)
    p = envPerc 0.0001 y
    tr = impulse kr (linLin x 0 1 3 9) 0
    e = envGen kr tr (linLin y 0 1 0.05 0.25) 0 0.1 DoNothing p
in X.membraneCircle ar (pinkNoiseId 'α' ar * e) tension loss
