// demanding studies (jmcc)
var s1 = Drand(#[72, 75, 79, 82], inf);
var s2 = Drand(#[82, 84, 86], 1);
var s3 = Dseq([72, 75, 79, s2], inf);
var x = MouseX.kr(5, 13, 'linear', 0.2);
var tr = Impulse.kr(x, 0);
var f = Demand.kr(tr, 0, [(s1 - 12).midicps, s3.midicps]);
var o1 = SinOsc.ar(f + #[0, 0.7], 0);
var o2 = Saw.ar(f + #[0, 0.7]) * 0.3;
var o3 = (o1 + o2).distort.log.distort.cubed;
o3 * 0.1
