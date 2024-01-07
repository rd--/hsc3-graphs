let numChannels = 8;
let triggerRate = MouseY(2, 200, 1, 0.2);
let trigger = Impulse(triggerRate, 0);
let sf = SfAcquireMono('floating_1');
let rate = Dseq(inf, [10, 1, 1, 0.5, 0.5, 0.2, 0.1]);
let centerPos = MouseX(0, SfDur(sf), 0, 0.2);
let dur = 4 / triggerRate;
let pan = Dseq(inf, [-1, -0.9 .. 1]);
let amp = 1 / 4;
let interp = 2;
TGrains(numChannels, trigger, sf, rate, centerPos, dur, pan, amp, interp).Splay
