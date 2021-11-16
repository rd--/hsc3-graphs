// tremulate (jmcc) ;  graph rewrite
var voiceFunc = {
    arg tr;
    var f = TRand.kr(400, 900, tr);
    var r = TRand.kr(30, 90, tr);
    var o = FSinOsc.ar(f * [1.0, 1.2, 1.5, 1.8], 0); // just minor seventh chord
    Mix.ar(Pan2.ar(o, { Rand.ir(-1, 1) }.dup(4), LFNoise2.kr([r, r, r, r]).mul(0.1).max(0))) };
CombN.ar(RTexture.xfadeGraph(voiceFunc, 2, 0.5), 0.1, 0.1, 1)

// tremulate (jmcc) ;  event control
var voiceFunc = {
    arg e;
    var s = FSinOsc.ar(e.x * 400 + 500 * [1.0, 1.2, 1.5, 1.8], 0); // just minor seventh chord
    var a = LFNoise2.kr({ Rand.ir(30, 90) }.dup(4) * (0.75 + e.rx)).max(0) * e.z;
    Mix.ar(Pan2.ar(s, { Rand.ir(-1, 1) }.dup(4) + (e.o * 2 - 1), a * e.w.lagud(0, e.ry * 2))) };
CombN.ar(Mix.ar(Voicer.ar(16, voiceFunc) * 0.5), 0.1, 0.1, 1)
