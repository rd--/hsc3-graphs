// https://scsynth.org/t/5296 ; tm881
Splay.ar({
    var osc = [LFDNoise1, LFDNoise3, LFDNoise0].choose;
    var o = osc.kr(1) * Rand.ir(333, 6666) + Rand.ir(333, 6666);
    var l = { XLine.kr(Rand.ir(0.125, 8), Rand.ir(0.125, 8), 150) }.dup(2);
    SinOsc.ar(o * l[0] + 666 * l[1])
}.dup(8)) * 0.1
