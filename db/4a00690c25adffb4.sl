(* LfSaw ; output range is bi-polar *)
let f = [LinLin(LfSaw(0.5, 1), -1, 1, 200, 1600), 200, 1600];
(SinOsc(f, 0) * [0.1, 0.05, 0.05]).Sum
