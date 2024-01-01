var numChannels = 8;
var triggerRate = 100;
var trigger = Impulse(triggerRate, 0);
var sf = SfAcquireMono('floating_1');
var rate = 1;
var centerPos = Integrator(BrownNoise().kr * 0.001, 1);
var dur = 8 / triggerRate;
var pan = TRand(-1, 1, trigger) * 0.6;
var amp = 1 / 4;
var interp = 4;
TGrains(numChannels, trigger, sf, rate, centerPos, dur, pan, amp, interp).Splay
