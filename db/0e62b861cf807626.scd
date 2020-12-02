// MiTides ; Lightbath -- Loom 4
{var bpm = 140;
 var period = (60 / bpm) * 6;
 var speed = 1.0 / period;
 var del_times = period / [6, 8];
 var trig = Impulse.kr(speed);
 var clock = Phasor.kr(trig);
 var pit = TChoose.kr(trig, [67, 60, 65]);
 var shape = LFTri.kr(0.11).range(0,1);
 var slope = LFTri.kr(0.11).range(0.5,0.8);
 var smooth = LFNoise1.kr(0.07).range(0.25,0.7);
 var chord = LFNoise1.kr(0.03).range(0.0,0.5);
 var oscs = MiTides.ar(pit.midicps, shape, slope, smooth, chord);
 var envs = MiTides.ar(speed, 0.35, 0, 0.46, 0.92, clock: clock, ratio: 9, rate: 0);
 var scaler = LFNoise1.kr( [0.1, 0.07, 0.11, 0.05] );
 var mix = oscs * envs * scaler;
 var out = Splay.ar(mix, center: LFTri.kr(0.1));
 var del = CombL.ar(out, 2, del_times, 6, mul: 0.5);
 out + del}
