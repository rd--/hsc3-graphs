// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4
Ringz.ar(Saw.ar(LFNoise0.kr(5).lag(MouseX.kr(0.01, 0.3, 0, 0.2)).exprange(100, 2000).round(20)) * 0.2, 1000, 0.01) * 0.1
