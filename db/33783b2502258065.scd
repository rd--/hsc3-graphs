// TScramble - c-major sin tones across stereo field, scrambles on impulse
var tr = Impulse.kr(1, 0);
SinOsc.ar(TScramble.kr(tr, [60, 62, 64, 65, 67, 69, 71, 72].midiCps), 0).splay2 * 0.1
