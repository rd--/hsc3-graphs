// alien froggies (jmcc) #1
OverlapTexture({
    arg tr;
    var rate = 11;
    var r = Fold.kr(rate * TRand.kr(-0.2, 0.2, tr).exp, 1, 30); // bilinrand
    Formant.ar(r, TExpRand.kr(200, 3000, tr), TRand.kr(0, 9, tr) * r + r) * 0.05;
}, 0.5, 0.25, 5)
