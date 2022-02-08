// pentatonic pipes (jmcc) ; mousex on right half of screen causes pulsation
var n = 5;
var env = Env.linen(0.2, 8, 1, 20, 'sine');
var mode = #[0, 3, 5, 7, 10].as(LocalBuf);
var root = 36 + 12.rand;
var z = RTexture.overlapGraph({
    arg tr;
    var f = (DegreeToKey.kr(mode, TRand.kr(0, 20, tr), 12) + root).midicps;
    var amp = EnvGen.kr(env, tr, 1, 0, 1, 0);
    Pan2.ar((Resonz.ar(PinkNoise.ar * amp, f, 0.002) * 4).distort * 0.2, TRand.kr(-1, 1, tr), 1);
}, 10, 0.01, n);
z = z * LinXFade2.kr(1, SinOsc.kr(5, 0).max(0), MouseX.kr(0, 1, 0, 0.2) > 0.5, 1);
CombN.ar(z, 0.3, 0.3, 8) + z.reverse
