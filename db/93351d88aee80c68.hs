-- dseq ; mce
let d = demand (impulse AR 8 0) 0 (dseq 'α' dinf (mce (map mce [[60,67],[59,62]])))
in sinOsc AR (midiCPS d) 0 * 0.1
