-- pulseCount
let c = pulseCount (impulse AR 10 0) (impulse AR 0.4 0)
in sinOsc AR (c * 200) 0 * 0.05
