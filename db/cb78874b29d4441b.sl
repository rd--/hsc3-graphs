/* TScramble ; c-major sin tones across stereo field, scrambles on impulse */
let tr = Impulse(1, 0);
SinOsc(TScramble(tr, [60 62 64 65 67 69 71 72].MidiCps), 0).Splay * 0.1
