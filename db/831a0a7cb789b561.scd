// tremulate (jmcc) ;  graph rewrite
var voiceFunc = {
    arg tr;
    var f = TRand.kr(400, 900, tr);
    var r = TRand.kr(30, 90, tr);
    var o = FSinOsc.ar(f * [1.0, 1.2, 1.5, 1.8], 0); // just minor seventh chord
    Mix.ar(Pan2.ar(o, { Rand.ir(-1, 1) } ! 4, LFNoise2.kr([r, r, r, r]).mul(0.1).max(0)))
};
CombN.ar(XFadeTexture(voiceFunc, 2, 0.5), 0.1, 0.1, 1)
