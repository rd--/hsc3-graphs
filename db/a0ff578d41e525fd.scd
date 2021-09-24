// jh ; https://scsynth.org/t/auditory-illusion-with-exponentially-spaced-frequencies/4157 ; rd (edit)
{var k = 100 // 200 ; c.f. 12 25 50 100 200 400 600 800
;var b = 2 // 4 ; c.f. 2, 3, 4
;var n = 0.02 // 0.002 ; c.f. 0.002 0.004 0.01 0.05 0.1 0.125
;var f0 = 180 // 300 ; c.f. 120 180 240
;var f = b ** Array.series(size: k, start: 0, step: n)
;Splay.ar(SinOsc.ar(freq: f * f0, phase: 0), spread: 1, level: 0.1, center: 0, levelComp: true)}
