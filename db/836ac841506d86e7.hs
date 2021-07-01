-- pan2 ; ctl=pan[:-0.1,-1,1,lin;pan]:0.1,-1,1,lin
let loc = sinOsc kr 0.5 0 `in_range` (control kr "pan[" 0,control kr "pan]" 0)
in pan2 (pinkNoiseId 'α' ar) loc 0.05
