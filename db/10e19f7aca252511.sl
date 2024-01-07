(* SfPlay ; normal playback at same speed of recording ; no loop, retrigger *)
let sf = SfAcquireMono('floating_1');
SfPlay(sf, 1, Impulse(1 / SfDur(sf), 0), 0, 0)
