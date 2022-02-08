-- tScramble ; two channel sin tones, channels scramble on impulse, scramble may be identity
let tr = impulse kr 1 0
in sinOsc ar (X.tScrambleId 'α' tr (mce2 440 880)) 0 * 0.1
