// Convolution
var tr = Dust.ar(100);
var vc = {
    var freq = TRand.ar(2700, 2750, tr);
    var amp = TRand.ar(0.1, 0.2, tr);
    HPF.ar(amp * Convolution.ar(Saw.ar(freq), tr, 512), 10000);
};
Splay.ar(vc ! 5)
