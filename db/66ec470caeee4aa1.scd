// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html
var n = 11;
var f = {
    var freq = Rand.ir(50, 560.3);
    var numcps = Rand.ir(2, 20);
    var knum = MulAdd(SinOsc.kr(ExpRand.ir(0.02, 0.2),  0), numcps / 2,  numcps / 2);
    Pan2.ar(Gendy1.ar(6.rand, 6.rand, 1.0.rand, 1.0.rand, freq , freq,  1.0.rand,  1.0.rand,  numcps,  knum),  1.0.rand2, 0.5 / n.sqrt)
};
Resonz.ar(Mix.ar(f.dup(n)), MouseX.kr(100,  2000, 0, 0.2), MouseY.kr(0.01,  1.0, 0, 0.2))
