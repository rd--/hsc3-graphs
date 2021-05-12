; Median ; long filters begIn chopping off the peaks of the waveform
(let ((x (Mul (SinOsc ar 1000 0) 0.1))) (mce2 x (Median 31 x)))
