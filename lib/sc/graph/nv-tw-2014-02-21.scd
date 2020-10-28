// https://twitter.com/headcube/status/437094206767513600
{Mix.fill(4,
{var x = Impulse.ar(0.05)
 ;20.do{var n = LFNoise2
       ;var a = AllpassL.ar(LeakDC.ar(x), 4, 8 ** kr(n, 0.1) / 2, 8) * 1.2
       ;x = LPF.ar(a, 8 ** n.kr({0.1.rand} ! 2) * 2500, 1).tanh}
 ;x * 5})}.play
