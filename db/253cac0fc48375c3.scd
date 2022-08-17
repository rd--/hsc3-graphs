// Blip
var ln = Ln.kr(1, 20, 60);
var tr = Impulse.kr(ln, 0);
Blip.ar(TRand.kr(100, 1000, tr), TRand.kr(1, 10, tr)) * Linen.kr(tr, 0, 0.5, 1 / ln, 0)
