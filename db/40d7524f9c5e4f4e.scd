// https://www.listarc.bham.ac.uk/lists/sc-users/msg68916.html (jrhb)
{var a = LFSaw.ar(0.02) * 300 + 1
;var b = LFSaw.ar(1.24 + [0, 0.1]) * 200 + 1
;SinOsc.ar(gcd(a, b) * 30 + 300) * 0.1}
