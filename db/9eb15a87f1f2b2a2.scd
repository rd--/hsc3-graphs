// shift register (dm) - https://sccode.org/1-590 ; keywords
var shiftRegister = { |length trig in|
	var buf = LocalBuf(numFrames: length, numChannels: 1);
	var count = PulseCount.kr(trig: trig, reset: 0);
	Demand.kr(trig: trig, reset: 0, demandUGens: Dbufwr(input: in, bufnum: buf, phase: count, loop: 1));
	Demand.kr(trig: trig, reset: 0, demandUGens: Dbufrd(bufnum: buf, phase: count + (1 .. length), loop: 1)).reverse
};
var amp = 0.1;
var pulse = Impulse.kr(freq: 1/16, phase: 0);
var rate = TChoose.kr(trig: pulse, array: [3, 5, 10]);
var trans = TChoose.kr(trig: pulse, array: [0, 2, -2, 7, -5]);
var trig = Trig1.kr(in: CuspL.ar(freq: rate * 3, a: 1, b: 1.9, xi: 0), dur: 0.001);
var octave = Demand.kr(trig: PulseDivider.kr(trig: trig, div: 4, start: 0), reset: 0, demandUGens: Drand(list: [12,-12], repeats: inf));
var note = Demand.kr(trig: trig, reset: 0, demandUGens: Dseq(list: [42, 46, 51, 54, 59, 63, 66].scramble + trans + octave, repeats: inf));
var chord = shiftRegister.value(5, trig, note);
var chordCps = chord.midicps;
var cf = Vibrato.ar(freq: K2A.ar(in: chordCps), rate: 6, depth: 0.02, delay: 0, onset: 0, rateVariation: 0.04, depthVariation: 0.1, iphase: 0, trig: 0);
var mf = chordCps * LFPulse.kr(freq: 1/8, iphase: 0, width: 0.5).range(lo: 1.01, hi: 2.01);
var sig = PMOsc.ar(carfreq: cf, modfreq: mf, pmindex: Env.new(levels: [3,3,0], times: [0, 0.2], curve: -4).kr(doneAction: 0, gate: trig));
var cmp = (sig * AmpCompA.kr(freq: chordCps, root: 0, minAmp: 0.32, rootAmp: 1) * amp).sum;
XFade2.ar(inA: [cmp, cmp], inB: GVerb.ar(in: BPF.ar(in: cmp, freq: 90.midicps, rq: 1), roomsize: 50, revtime: 8, drylevel: 0), pan: 0.2, level: 1)
