-- in ; read control bus
let b = control KR "bus" 0
in sinOsc AR (in' 1 KR b) 0 * 0.1
