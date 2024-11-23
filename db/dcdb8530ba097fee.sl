/* StaticLoss ; requries=WaveLoss */
let amp = 1; let freq = 1200; let rq = 1; let db = -45; let gate = 1; let pan = -0.5;
let src = WaveLoss(PinkNoise() * 0.1, 39, 40, 1);
Pan2(BPeakEq(src, freq, rq, db), pan, amp)
