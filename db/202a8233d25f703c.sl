/* TGrains ; requires=SfAcquire */
let numChannels = 2;
let sf = SfAcquireMono('CrotaleD6');
let triggerRate = MouseY(2, 120, 1, 0.2);
let trigger = Impulse(triggerRate, 0);
let rate = 1.2 ^ (WhiteNoise() * 3).RoundTo(1);
let centerPos = MouseX(0, SfDur(sf), 0, 0.2);
let dur = 1.2 / triggerRate;
let pan = TRand(-1, 1, trigger);
let amp = 1 / 2;
let interp = 4;
TGrains(numChannels, trigger, sf, rate, centerPos, dur, pan, amp, interp)
