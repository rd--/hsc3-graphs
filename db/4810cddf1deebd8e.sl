let numChannels = 8;
let triggerRate = MouseY(8, 120, 1, 0.2);
let trigger = Dust(triggerRate);
let sf = SfAcquireMono('floating_1');
let rate = 1;
let centerPos0 = MouseX(0, SfDur(sf), 0, 0.2);
let centerPos = centerPos0 + TRand(0, 0.01, trigger);
let dur = 4 / triggerRate;
let pan = TRand(-1, 1, trigger) * 0.6;
let amp = 1 / 4;
let interp = 4;
TGrains(numChannels, trigger, sf, rate, centerPos, dur, pan, amp, interp).Splay
