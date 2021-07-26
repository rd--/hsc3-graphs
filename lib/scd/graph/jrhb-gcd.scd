// https://www.listarc.bham.ac.uk/lists/sc-users/msg68916.html (jrhb)
{var a = LFSaw.ar(2) * 100
;var b = LFSaw.ar(1.2) * 100
;SinOsc.ar(a.lcm(b) + 300) * 0.1}

// https://www.listarc.bham.ac.uk/lists/sc-users/msg68916.html (jrhb)
{var a = LFSaw.ar(0.02) * 300 + 1
;var b = LFSaw.ar(1.24 + [0, 0.1]) * 200 + 1
;SinOsc.ar(a.gcd(b) * 30 + 300) * 0.1}

// https://www.listarc.bham.ac.uk/lists/sc-users/msg68916.html (jrhb)
{var a = LFSaw.ar(0.012) * 300 + 1
;var b = LFSaw.ar(0.24 + [0, 0.01]) * 200 + 1
;SinOsc.ar(a.gcd(b) * 30 + 300) * 0.1}

// https://www.listarc.bham.ac.uk/lists/sc-users/msg68916.html (jrhb)
{var a = LFSaw.kr(0.002) * 300 + 1
;var b = LFSaw.kr(0.024 + [0, 0.001]) * 200 + 1
;SinOsc.ar(a.gcd(b) * 43 + 300) * 0.1}

// generative landscape (jrhb) ; https://www.listarc.bham.ac.uk/lists/sc-users/msg68991.html
{var x = MouseX.kr(-10, 10, 0, 0.1)
;var y = MouseY.kr(0, 5, 0, 0.1)
;var i = LFSaw.kr(0.062,0).range(-10, 10) + (y * 0.to(8).asArray)
;var d = i.frac
;var a = 0.8 - d.moddif(0.5, 1)
;var z1 = i.gcd(x) + d
;var z2 = i.lcm(x) + d
;var freq = 120 * ([z1, z2].flop.abs + 1)
;(SinOsc.ar(freq,0) * AmpComp.kr(freq,261.625,1/3) * a).mean * 0.1}
