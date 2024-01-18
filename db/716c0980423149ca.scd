// shift register (dm) - https://sccode.org/1-590
var shift_register = { |length trig in|
    var buf = LocalBuf.ir(length, 1);
    var count = PulseCount.kr(trig, 0);
    Demand.kr(trig, 0, Dbufwr.dr(in, buf, count, 1));
    Demand.kr(trig, 0, Dbufrd.dr(buf, count + 1 + (0 .. length - 1), 1)).reverse
};
var amp = 0.1;
var pulse = Impulse.kr(1/16);
var rate = TChoose.kr(pulse, [3, 5, 10]);
var trans = TChoose.kr(pulse, [0, 2, -2, 7, -5]);
var trig = Trig1.kr(CuspL.ar(rate * 3), 0.001);
var octave = Demand.kr(PulseDivider.kr(trig, 4), 0, Drand.dr([12, -12], inf));
var note = Demand.kr(trig, 0, Dseq.dr([42, 46, 51, 54, 59, 63, 66].scramble + trans, inf) + octave);
var chord = shift_register.value(5, trig, note);
var chord_cps = chord.midicps;
var cf = Vibrato.ar(K2A.ar(chord_cps));
var mf = chord_cps * LFPulse.kr(1/8).range(1.01, 2.01);
var sig = PMOsc.ar(cf, mf, Env.new([3, 3, 0], [0, 0.2], -4).kr(0, trig));
var cmp = (sig * AmpCompA.kr(chord_cps) * amp).sum;
XFade2.ar(cmp ! 2, GVerb.ar(BPF.ar(cmp, 90.midicps), 50, 8, 0.5, 0.5, 15, 0, 0.7, 0.5, 300), 0.2)
