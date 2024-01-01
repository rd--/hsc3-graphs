var numChannels = 8;
var trigger = Impulse(440, 0);
var sf = SfAcquireMono('floating_1');
var rate = 1.2 ^ TiRand(-3, 3, trigger);
var centerPos = MouseX(0, SfDur(sf), 0, 0.2);
var dur = 1.2 / MouseY(2, 120, 1, 0.2);
var pan = TRand(-1, 1, trigger) * 0.6;
var amp = 1 / 4;
var interp = 4;
TGrains(numChannels, trigger, sf, rate, centerPos, dur, pan, amp, interp).Splay
