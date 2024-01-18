// TScramble ; c-major sin tones across stereo field, scrambles on impulse ; audio rate
var tr = Impulse.ar(1, 0);
Splay.ar(SinOsc.ar(TScramble.ar(tr, [60, 62, 64, 65, 67, 69, 71, 72].midicps), 0)) * 0.1
