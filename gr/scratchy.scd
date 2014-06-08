// scratchy (jmcc) #1

{var n = BrownNoise.ar([0.5, 0.5])
;var f = (n - 0.49).max(0) * 20
;RHPF.ar(f, 5000, 1)}.play
