-- mouseY ; variant with equal arguments but a random traversal
let freq = mouseXRand kr 20 2000 Exponential 0.1
    ampl = mouseYRand kr 0.01 0.1 Linear 0.1
in sinOsc ar freq 0 * ampl
