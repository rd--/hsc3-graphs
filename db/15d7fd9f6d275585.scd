// modified from a patch by Landon Rose ; jmcc #8 ; graph rewrite
var m = #[[32, 43, 54, 89], [10, 34, 80, 120], [67, 88, 90, 100], [14, 23, 34, 45]];
var f = {
    arg i;
    var s = { PinkNoise.ar() * 0.001 }.dup;
    var e = LinSeg.kr(Impulse.kr(0.125, #[0, 0.25, 0.5, 0.75].nth(i)), #[0, 2, 1, 2, 0]);
    RingzBank.ar(s, m.nth(i).midicps, #[1], #[3]) * e
};
1.to(4).collect(f).sum