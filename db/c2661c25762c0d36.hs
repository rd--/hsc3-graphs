-- in ; read control bus
let b = control kr "bus" 0
in sinOsc ar (in' 1 kr b) 0 * 0.1
