;; MiBraids ; trigger ; 28=plucked
var trig = Dust(0.6);
var pitch = TRand(45, 72, trig).RoundTo(1);
var timbre = 0.5;
var color = LfNoise1(0.3) * 0.5 + 0.5;
MiBraids(pitch: pitch, timbre: timbre, color: color, model: 28, trig: trig, resamp: 0, decim: 0, bits: 0, ws: 0) ! 2 * 0.1
