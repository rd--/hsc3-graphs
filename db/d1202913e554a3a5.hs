-- vibrato ; mce
let v = vibratoId 'α' ar (dc ar (mce2 (mce2 411 440) (mce2 419 440.5))) 1 0.02 0 0 0.04 0.1 0 0
in mix (sinOsc ar v 0 * 0.1)
