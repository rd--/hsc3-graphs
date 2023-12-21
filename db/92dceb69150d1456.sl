(* StaticLoss ; requries=WaveLoss *)
var amp = 1, freq = 1200, rq = 1, db = -45, gate = 1, pan = -0.5;
var src = WaveLoss(PinkNoise() * 0.1, 39, 40, 1);
Pan2(BPeakEq(src, freq, rq, db), pan, amp)
