(* SinOsc ; two oscillators ; frequencies approach 500 from opposite directions *)
let lfo = MouseX(1, 0, 0, 0.2);
let sig = SinOsc(LinExp(lfo, 0, 1, 100, 500), 0) + SinOsc(LinExp(lfo, 0, 1, 1000, 500), 0);
sig * 0.1
