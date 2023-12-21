(* 20060922 ; rd ; requires=Perc *)
var t0 = Impulse(1 / 0.30, 0);
var t1 = TDelay(t0, 0.15);
var t = [t0, t1];
var k = TRand(56, 57, t);
var i = TRand(40, 480, t);
var j = TRand(-1, 1, t);
var c = k.MidiCps;
var m = (k + 1 + j).MidiCps;
var e = Perc(t, 0.01, 0.9, [-4, -4]);
var f = SinOsc(c, 0) * i + m;
SinOsc(f, 0) * e * 0.1
