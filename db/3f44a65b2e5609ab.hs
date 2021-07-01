-- sampleRate ; the current nominal sample rate of the server
let sr = 48000 {- 44100 -}
    f = mce2 sampleRate sr * 0.01
in sinOsc ar f 0 * 0.1
