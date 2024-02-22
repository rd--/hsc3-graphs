// https://sccode.org/1-4Qy ; f0 ; 0331
var b = [3, 3, 2, 2, 2, 1, 2, 2, 2]/3;
var c = Spring.ar(TDuty.ar(Dseq(b, inf)) / 9, 1, 0);
Ringz.ar(c, 50 * Duty.ar(c + 1 / [6, 3], 0, Dseq(c.lag(0.1) > 0 + [2, 4] / b, inf)))
