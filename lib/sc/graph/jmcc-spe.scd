// spe (jmcc)

{var t = Impulse.kr(9,0)
;var s = [00,03,02,07,08,32,16,18,00,12,24,32]
;var m = Dseq(s,inf)
;var f = (Demand.kr(t,0,m) + 32).midicps
;var e = EnvGen.kr(Env.perc, gate: t, levelScale: 0.1, doneAction: 0)
;var o = LFSaw.ar(f) * e
;var rq = LFNoise1.kr(1, 36, 110).midicps
;var z = RLPF.ar(o, rq, 0.1)
;4.do({z = AllpassN.ar(z, 0.05, [0.05.rand, 0.05.rand], 4)})
;z}.play
