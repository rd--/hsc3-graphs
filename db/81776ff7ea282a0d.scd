// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.5 ; am, fm, chorus
var src = Saw.ar(#[440, 443, 437] + (SinOsc.ar(100, 0) * 100));
var amp = LFSaw.kr(Line.kr(3, 17, 3),0) * 0.5 + 0.5 * Line.kr(1, 0, 10);
Mix.ar(Resonz.ar(src, XLine.kr(10000, 10, 10), Line.kr(1, 0.05, 10)) * amp)
