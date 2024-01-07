(* Idiv ; integer division ; quotient *)
let d = (SinOsc(0.25, 0) * 200 + 500) // 17;
SinOsc((d * 3).MidiCps, 0) * 0.1
