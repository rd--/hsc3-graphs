-- lorenzL ; vary frequency
let x = mouseX KR 20 sampleRate Linear 0.1
in lorenzL AR x 10 27 2.667 0.05 0.1 0 0 * 0.3
