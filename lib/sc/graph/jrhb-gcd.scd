// https://www.listarc.bham.ac.uk/lists/sc-users/msg68916.html (jrhb)
{var a = LFSaw.ar(2) * 100
;var b = LFSaw.ar(1.2) * 100
;SinOsc.ar(lcm(a, b) + 300) * 0.1}

// https://www.listarc.bham.ac.uk/lists/sc-users/msg68916.html (jrhb)
{var a = LFSaw.ar(0.02) * 300 + 1
;var b = LFSaw.ar(1.24 + [0, 0.1]) * 200 + 1
;SinOsc.ar(gcd(a, b) * 30 + 300) * 0.1}

// https://www.listarc.bham.ac.uk/lists/sc-users/msg68916.html (jrhb)
{var a = LFSaw.ar(0.012) * 300 + 1
;var b = LFSaw.ar(0.24 + [0, 0.01]) * 200 + 1
;SinOsc.ar(gcd(a, b) * 30 + 300) * 0.1}

// https://www.listarc.bham.ac.uk/lists/sc-users/msg68916.html (jrhb)
{var a = LFSaw.kr(0.002) * 300 + 1
;var b = LFSaw.kr(0.024 + [0, 0.001]) * 200 + 1
;SinOsc.ar(gcd(a, b) * 43 + 300) * 0.1}
