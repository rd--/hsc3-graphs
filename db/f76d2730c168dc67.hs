-- vibrato ; at 1 Hz, note the use of DC.ar
let v = vibrato 'α' AR (dc AR 400) 1 0.02 0 0 0.04 0.1 0 0
in sinOsc AR v 0 * 0.1
