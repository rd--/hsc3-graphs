-- pulseCount
let c = pulseCount (impulse ar 10 0) (impulse ar 0.4 0)
in sinOsc ar (c * 200) 0 * 0.05
