-- pan2 ; ctl=pan[:-0.1,-1,1,lin;pan]:0.1,-1,1,lin
let loc = sinOsc KR 0.5 0 `in_range` (control KR "pan[" 0,control KR "pan]" 0)
in pan2 (pinkNoise 'α' AR) loc 0.05
