// https://www.listarc.bham.ac.uk/lists/sc-users/msg68916.html (jrhb);
var a = LFSaw.kr(0.002) * 300 + 1;
var b = LFSaw.kr(0.024 + [0, 0.001]) * 200 + 1;
SinOsc.ar(a.gcd(b) * 43 + 300) * 0.1
