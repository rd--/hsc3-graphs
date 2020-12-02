-- lastValue
let x = mouseX KR 100 400 Linear 0.1
in sinOsc AR (lastValue x 40) 0 * 0.1
