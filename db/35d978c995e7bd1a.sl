let numChannels = 8;
let triggerRate = MouseY(1, 400, 1, 0.2);
let trigger = Impulse(triggerRate, 0);
let sf = SfAcquireMono('Floating');
let rate = 2 ^ TRand(-2, 2, trigger);
let centerPos = MouseX(0, SfDur(sf), 0, 0.2);
let dur = 8 / triggerRate;
let pan = TRand(-1, 1, trigger) * 0.6;
let amp = 1 / 4;
let interp = 4;
TGrains(numChannels, trigger, sf, rate, centerPos, dur, pan, amp, interp).Splay
