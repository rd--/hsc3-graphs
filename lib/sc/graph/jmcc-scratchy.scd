// scratchy (jmcc) #1
{var n = BrownNoise.ar([0.5, 0.5]) - 0.49
;var f = n.max(0) * 20
;RHPF.ar(f, 5000, 1)}
