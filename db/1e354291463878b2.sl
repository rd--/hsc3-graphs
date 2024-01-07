let numChannels = 8;
let trigger = Impulse(440, 0);
let sf = SfAcquireMono('floating_1');
let rate = 1.2 ^ TiRand(-3, 3, trigger);
let centerPos = MouseX(0, SfDur(sf), 0, 0.2);
let dur = 1.2 / MouseY(2, 120, 1, 0.2);
let pan = TRand(-1, 1, trigger) * 0.6;
let amp = 1 / 4;
let interp = 4;
TGrains(numChannels, trigger, sf, rate, centerPos, dur, pan, amp, interp).Splay
