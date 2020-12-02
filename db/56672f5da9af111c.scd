// https://www.listarc.bham.ac.uk/lists/sc-users/msg68916.html (jrhb)
{var a = LFSaw.ar(0.012) * 300 + 1
;var b = LFSaw.ar(0.24 + [0, 0.01]) * 200 + 1
;SinOsc.ar(gcd(a, b) * 30 + 300) * 0.1}
