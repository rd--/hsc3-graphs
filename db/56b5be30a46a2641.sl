(* https://sccode.org/1-4Qy ; f0 ; 0240 ; requires=BLowPass4 *)
let l = ' #SuperCollider '.ascii.Array.pyramid(6);
let d = Pulse(Duty(1 / [10, 4], 0, Dseq(99, l.MidiCps)).mean, 0.5);
EqPan(CombN(BLowPass4(d, 1200, 1), 1, 1, 8) / 2, d) / 2
