(* Interesting drone *)
let freq = [40 42 43 45 47 48 41 42].MidiCps;
let amp = LfNoise1({ Rand(0.1, 0.5) } ! 8) * 0.5 + 0.5;
Pan2(SinOsc(freq, 0), { 1.Rand2 } ! 8, amp).Mix * 0.1
