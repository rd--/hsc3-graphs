// TScramble ; c-major sin tones across stereo field, scrambles on impulse ; control rate
var tr = Impulse.kr(1, 0);
Splay.ar(SinOsc.ar(TScramble.kr(tr, [60, 62, 64, 65, 67, 69, 71, 72].midicps), 0)) * 0.1
