{ var t_half = 3.92
; var n_atoms = 1e+5
; var n = max(0, n_atoms - PulseCount.ar(LocalIn.ar(2), 0))
; var activity = Dust.ar(n * 2.log / t_half)
; LocalOut.ar(activity)
; activity * 0.2 }
