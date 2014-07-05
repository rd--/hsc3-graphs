// https://twitter.com/thormagnusson/status/463992770596577280

var f = {
    arg i;
    var x = i + 1;
    var e = LFNoise2.ar(0.5) * (Line.ar(0,0.1,99.rand) / (x * 0.2));
    SinOsc.ar(30*x+LFNoise2.ar(0.1).range(-2,2),0,e)
};
var g = {(f ! rrand(9,28)).sum};
{g ! 2}.play;
