;; https://sccode.org/1-4Qy ; f0 ; 0240 ; requires=BLowPass4
var l = ' #SuperCollider '.ascii.asArray.pyramid(6);
var d = Pulse(DmdFor(1 / [10, 4], 0, Seq(99, l.MidiCps)).mean, 0.5);
Pan2(CombN(BLowPass4(d, 1200, 1), 1, 1, 8) / 2, d, 1) / 2
