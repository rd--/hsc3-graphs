// https://twitter.com/thormagnusson/status/463992770596577280 (tm)
var k = 9.rrand(28);
var f = {
    arg x;
    var e = LFNoise2.ar(0.5) * Line.ar(0, 0.1, Rand(0, 99)) / (x * 0.2);
    SinOsc.ar(30 * x + LinLin.ar(LFNoise2.ar(0.1), -1, 1, -2, 2), 0) * e
};
{ 1.to(k).collect(f).sum }.dup
