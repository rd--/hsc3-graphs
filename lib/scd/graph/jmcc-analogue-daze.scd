// analogue daze (jmcc) #3
{
var pattern = #[55,63,60,63,57,65,62,65];
var f = {
    arg octave, clockRate, pwmrate, fltrate;
    var sequ = {arg s, tr; Demand.kr(trig: tr, reset: 0, demandUGens: Dseq.new(s, inf))};
    var tr = Impulse.kr(freq: clockRate, phase: 0);
    var patternCps = (pattern + (12 * octave)).midicps;
    var sq = sequ.value(patternCps, tr);
    var pwm = SinOsc.kr(freq: pwmrate, phase: (2 * pi).rand, mul: 0.4, add: 0.5);
    var cf = SinOsc.kr(freq: fltrate, phase: (2 * pi).rand, mul: 1400, add: 2000);
    RLPF.ar(in: LFPulse.ar(freq: Lag.kr(in: sq, lagTime: 0.05), iphase: 0, width: pwm, mul: 0.1), freq: cf, rq: 1/15);
};
var a = LFNoise0.ar(freq: LFNoise1.kr(freq: 0.3, mul: 6000, add: 8000), mul: [0.07,0.07]);
var x = Decay.ar(in: Impulse.ar(freq: 2, phase: 0), decayTime: 0.15, mul: a);
var g = x + [f.value(1,8,0.31,0.2), f.value(0,2,0.13,0.11)];
var z = (CombN.ar(in: g, maxdelaytime: 0.375, delaytime: 0.375, decaytime: 5) + g.reverse) * 0.4;
var e = Env.linen(attackTime: 2, sustainTime: 56, releaseTime: 2, level: 1, curve: 'lin');
z * EnvGen.kr(envelope: e, doneAction:2);
}
