-- sinOsc ; control input for frequency ; ie. withSC3 (Sound.OSC.sendMessage (n_set1 (-1) "mnn" 64))
sinOsc ar (midiCps (control kr "mnn" 69)) 0 * 0.25
