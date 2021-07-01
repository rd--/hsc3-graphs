-- dseq ; mce
let d = demand (impulse ar 8 0) 0 (dseqId 'α' dinf (mce (map mce [[60,67],[59,62]])))
in sinOsc ar (midiCPS d) 0 * 0.1
