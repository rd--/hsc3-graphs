-- slew
let z = lfPulse AR 800 0 0.5 * 0.1 in mce2 z (slew z 4000 4000)
