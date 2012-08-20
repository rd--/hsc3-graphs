var rate = 11.0;
play({OverlapTexture.ar({
rate = (rate * (0.2.bilinrand.exp)).fold(1.0,30.0);
var o = Formant.ar(rate,exprand(200,3000.0),9.0.rand * rate + rate,0.05)},
0.5,0.25,5,1)})
