let numChannels = 8;
let triggerRate = 100;
let trigger = Impulse(triggerRate, 0);
let sf = SfAcquireMono('floating_1');
let rate = 1;
let centerPos = Integrator(BrownNoise().kr * 0.001, 1);
let dur = 8 / triggerRate;
let pan = TRand(-1, 1, trigger) * 0.6;
let amp = 1 / 4;
let interp = 4;
TGrains(numChannels, trigger, sf, rate, centerPos, dur, pan, amp, interp).Splay
