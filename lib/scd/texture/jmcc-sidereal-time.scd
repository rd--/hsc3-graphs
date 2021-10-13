// sidereal time (jmcc) #9 ; rand at server
RTexture.overlap({
    var p = 15;
    var h = { Ref.new([{ ExpRand.ir(100, 6000) }.dup(p), nil, { Rand.ir(2, 6) }.dup(p)]) };
    var z = h.dup(2);
    var f = XLine.kr(ExpRand.ir(40, 300), ExpRand.ir(40, 300), 12);
    var t = LFPulse.ar(f, 0, Rand.ir(0.1, 0.9)) * 0.002 * LFNoise2.kr(Rand.ir(0, 8)).max(0);
    Klank.ar(z, t).distort * 0.1
}, 4, 4, 6, 2, inf, { arg z; CombN.ar(z, 0.6, 0.5.rand + 0.1, 8) + z.reverse })

// sidereal time (jmcc) #9 ; rand at language
RTexture.overlap({
    var p = 15;
    var h = { Ref.new([{ 100.0.exprand(6000.0) }.dup(p), nil, { 2.0 + 4.0.rand }.dup(p)]) };
    var z = h.dup(2);
    var f = XLine.kr(40.0.exprand(300.0), 40.0.exprand(300.0), 12);
    var t = LFPulse.ar(f, 0, 0.1.rrand(0.9)) * 0.002 * LFNoise2.kr(8.0.rand).max(0);
    Klank.ar(z, t).distort * 0.1
}, 4, 4, 6, 2, inf, { arg z; CombN.ar(z, 0.6, 0.5.rand + 0.1, 8, 1, z.reverse) })
