// <http://www.listarc.bham.ac.uk/lists/sc-users/msg47539.html>

{var blocksize = ControlRate.ir.reciprocal
;var mk_dt = {arg f; f.reciprocal - blocksize}
;var string_dt = mk_dt.(60)
;var c = 425
;var len = 40
;var pk1_p = 0.1
;var src_p = 0.3
;var pk2_p = 0.9
;var max_dt = 1
;var mk_dl = {arg i, r; LPZ1.ar(DelayC.ar(i, max_dt, r * string_dt))}
;var mk_ap = {arg i, r, dt; LPZ1.ar(AllpassC.ar(i, max_dt, r * string_dt, dt))}
;var drv = LocalIn.ar(1)
;var r = {Rand(0.001, 0.11)}
;var pk1_R = mk_dl.(drv, src_p - pk1_p, 2 + r.())
;var pk1_L = mk_ap.(pk1_R * -1, pk1_p * 2, r.())
;var pk2_L = mk_dl.(pk1_L, pk2_p - pk1_p, r.()) * 0.99
;var strL = mk_dl.(pk2_L, 1 - pk2_p, r.())
;var pk2_R = mk_ap.(strL * -1, 1 - pk2_p, 2 + r.()) * 0.99
;var strR = mk_dl.(pk2_R, pk2_p - src_p, 2 + r.())
;var src = {var a = Amplitude.kr(drv, mul: 11)
           ;var p = Pulse.ar(60 + a, mul: 0.1)
           ;RLPF.ar((SinOsc.ar(220, 0) * 0.01) + p, 320, 0.05)}
;var src_n = {var a = Amplitude.kr(drv).min(1.0)
             ;Normalizer.ar(src, 0.7) * (1.0 - a)}
;LocalOut.ar(src * 0.2 + strR)
;[pk1_L + pk1_R, pk2_L + pk2_R, drv, src]}.play
