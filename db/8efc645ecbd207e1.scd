// https://twitter.com/redFrik/status/1246461901669838848
{var c = LFPulse.ar(1 / 11, 0, 1 / 4) * 99 + 99
;var l1 = SinOscFB.ar(1 / 11, 0) / 2 + 1 / 9
;var f1 = LFPulse.ar(1 / #[8, 9] + LFPulse.ar(0.1, 0, 0.5), 0, 0.5).lag(l1) * 4 / 3 + 1 ** LFPulse.ar(1 / #[9,8], 0, 0.5) * c
;var l2 = SinOscFB.ar(1 / #[5,4], 0).max(0) / 9
;var f2 = Pitch.kr(LFPulse.ar(f1, 0, 0.5).lag(l2).sum, 440, 60, 4000, 100, 16, 1, 0.01, 0.5, 1, 0)[0]
;var d = SinOscFB.ar(f2, LFPulse.ar(1 / [LFPulse.ar(1 / 9, 0, 0.5) + 2, 3], 0, 0.5).lag(0.1) / 4 + 0.3)
;var e = PitchShift.ar(d / 2, 2, #[3,2] - LFPulse.ar(1 / #[18, 17], 0, 0.5).lag(0.1), 0, 0)
;HPF.ar(d + e, 9) / 4 / 4}
