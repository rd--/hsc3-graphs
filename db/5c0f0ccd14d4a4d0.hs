-- tScramble ; c-major sin tones across stereo field, scrambles on impulse
let tr = impulse KR 1 0
    f = X.tScramble 'α' tr (mce (map midiCPS [60,62,64,65,67,69,71,72]))
in splay (sinOsc AR f 0 * 0.1) 1 1 0 True
