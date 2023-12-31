// tw 0220 (f0) - http://www.fredrikolofsson.com/f0blog/?q=node/617
var c = InFeedback.ar(0, 1);
var b = LocalBuf.ir(90000, 1).clear;
var g = TGrains.ar(2, SinOsc.ar(3, 0), b, c + 3, 2, 12, 0, 0.1, 4);
var w = RecordBuf.ar(c, b, 0, 1, 0, 1, 1, 1, 0);
HPF.ar(SinOsc.ar(99, c * 6) / 9 + g, 9) <! w
