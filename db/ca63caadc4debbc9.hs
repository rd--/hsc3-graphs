-- median ; long filters begin chopping off the peaks of the waveform
let x = sinOsc ar 1000 0 * 0.2
in mce [x, median 31 x]
