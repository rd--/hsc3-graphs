// https://scsynth.org/t/5296 ; tm881
Splay2({
    var osc = [LFDNoise1, LFDNoise3, LFDNoise0].choose;
    var o = osc.kr(1) * Rand.ir(333, 6666) + Rand.ir(333, 6666);
    var l = { XLine.kr(Rand.ir(0.125, 8), Rand.ir(0.125, 8), 150) }.dup(2);
    SinOsc.ar(o * l.first + 666 * l.second)
}.dup(8)) * 0.1
