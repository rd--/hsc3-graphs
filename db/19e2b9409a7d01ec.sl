(********** Analog bubbles ; Jmcc **********)
let f = LfSaw(0.4, 0).MulAdd(24, LfSaw([8, 7.23], 0).MulAdd(3, 80)).MidiCps; (* glissando function *)
CombN(SinOsc(f, 0) * 0.04, 0.2, 0.2, 4) (* echoing sine wave *)
