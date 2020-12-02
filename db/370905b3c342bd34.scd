// MiRipples
{var trig = Impulse.ar(4);
 var input = Decay.ar(trig, 0.1);
 var cf = TRand.ar(0.1, 0.6, trig);
 var filt = RLPF.ar(cf, 80, 0.3);
 MiRipples.ar(input, filt, 0.8, drive: 3, mul: 0.5)}
