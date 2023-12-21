// sc-140 ; 03 ; Tim Walters ; sc140_sourcecode.txt
var f = {
    arg k;
    0.to(7).collect {
        arg i;
        var  e = Decay.kr(Dust.kr(1 / 4 ** i), SinOsc.ar(0.1, 0) + 1 * k + i) * k * 999;
        var ph = SinOsc.ar(i * k ** i / #[4, 5], 0) * e;
        SinOsc.ar(i * k * k, ph)
    }.product
};
0.to(15).collect(f).sum
