(* https://sccode.org/1-4Qy ; f0 ; 0331 *)
let b = [3 3 2 2 2 1 2 2 2] / 3;
let c = Spring(ImpulseSequencer(b, Impulse(1, 0)) / 9, 1, 0);
Ringz(c, 50 * HoldSequence(Lag(c, 0.1) > 0 + [2 4] / b, c + 1 / [6 3]), 1)
