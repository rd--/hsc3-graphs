// TScramble ; initially unscrambled
var tr = Dust.kr(1);
SinOsc.ar(TScramble.kr(tr, #[60, 62, 64, 65, 67, 69, 71, 72].midicps), 0).splay * 0.1
