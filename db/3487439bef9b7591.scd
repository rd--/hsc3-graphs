// saucer base (jmcc) #6 ; texture=overlap,6,2,4,inf
var b = Rand(0, 1000);
var c = Rand(0, 5000);
var o1 = SinOsc.ar(Rand(0, 20), 0) * b + (1.1 * b);
var o2 = SinOsc.ar(o1, 0) * c + (1.1 * c);
var o3 = SinOsc.ar(o2, 0) * 0.1;
Pan2.ar(o3, Rand(-1, 1))
