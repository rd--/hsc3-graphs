var numChannels = 8;
var triggerRate = MouseY(8, 120, 1, 0.2);
var trigger = Impulse(triggerRate, 0);
var sf = SfAcquireMono('floating_1');
var rate = 1;
var centerPos0 = MouseX(0, SfDur(sf), 0, 0.2);
var centerPos = centerPos0 + TRand(0, 0.01, trigger);
var dur = 12 / triggerRate;
var pan = TRand(-1, 1, trigger) * 0.6;
var amp = 1 / 4;
var interp = 4;
TGrains(numChannels, trigger, sf, rate, centerPos, dur, pan, amp, interp).Splay
