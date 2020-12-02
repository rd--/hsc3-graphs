; median ; long filters begin chopping off the peaks of the waveform
(let ((x (mul (sin-osc ar 1000 0) 0.1))) (mce2 x (median 31 x)))
