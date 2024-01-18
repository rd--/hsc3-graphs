// https://sccode.org/1-5fc (dst)
Voicer(0, 16) { | e |
    var tr = Trig.kr(e.w, e.y * 0.002 + 0.001);
    var buf = [0, 7, 15.93, 5, 9.7, 12, 17.5, 13.1].asLocalBuf;
    var samp = TExpRand.kr(0.07, 0.5, tr);
    var root = TChoose.kr(tr, [23, 30, 35, 37]);
    var atk = TExpRand.kr(0.04, 0.3, tr);
    var decay = TExpRand.kr(6, 15, tr);
    var amp = TRand.kr(0.15, 0.5, tr);
    var bottom = TChoose.kr(tr, [2, 5]);
    var top = TRand.kr(7, 9.1, tr);
    var cfreq = e.x * 2300 + 120;
    var rq = samp + TRand.kr(0.1, 0.15, tr);
    var rate = TExpRand.kr(0.1, 3, tr);
    var index = LinLin.kr(LFSaw.kr(samp, 0), -1, 1, bottom, top) * BufFrames.kr(buf);
    var tonic = DegreeToKey.kr(buf, index, 12) + root;
    var env = Decay2.kr(tr, atk, decay) * 0.35;
    var sig = BPF.ar(SyncSaw.ar(root.midicps, tonic.midicps) * env, cfreq, rq) * amp;
    var loc = Pan2.ar(sig, SinOsc.kr(rate * 0.9 + Rand(-0.6, 0.6), 0), 1);
    var cmb = CombL.ar(loc, 0.1, SinOsc.kr(0.01, 0) * 0.03 + 0.07, 5) * 0.7;
    XFade2.ar(LPF.ar(cmb, 4800), loc, -0.5, 0.3)
}.sum
