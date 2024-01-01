var numChannels = 8;
var triggerRate = MouseY(2, 200, 1, 0.2);
var trigger = Impulse(triggerRate, 0);
var sf = SfAcquireMono('floating_1');
var rate = Dseq(inf, [10, 1, 1, 0.5, 0.5, 0.2, 0.1]);
var centerPos = MouseX(0, SfDur(sf), 0, 0.2);
var dur = 4 / triggerRate;
var pan = Dseq(inf, [-1, -0.9 .. 1]);
var amp = 1 / 4;
var interp = 2;
TGrains(numChannels, trigger, sf, rate, centerPos, dur, pan, amp, interp).Splay
