-- freeSelfWhenDone ; mouseX is trigger ; using RemoveSynth doneAction
let x = mouseX kr (-1) 1 Linear 0.1
    e = linen x 1 0.1 1 RemoveSynth
in sinOsc ar 440 0 * e
