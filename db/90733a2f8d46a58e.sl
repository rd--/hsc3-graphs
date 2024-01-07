(* Analog bubbles (Jmcc) #1 ; variable bindings *)
let o = LfSaw([8, 7.23], 0) * 3 + 80;
let m = LfSaw(0.4, 0) * 24 + o;
CombN(SinOsc(m.MidiCps, 0) * 0.04, 0.2, 0.2, 4) * 0.1
