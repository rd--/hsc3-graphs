// analogue daze (jmcc) #3
{
var pattern = #[55,63,60,63,57,65,62,65];
var f = {
    arg octave, clockRate, pwmrate, fltrate;
    var sequ = {arg s, tr; Demand.kr(tr, 0, Dseq.new(s, inf))};
    var tr = Impulse.kr(clockRate);
    var patternCps = (pattern + (12 * octave)).midicps;
    var sq = sequ.value(patternCps, tr);
    var pwm = SinOsc.kr(pwmrate, (2 * pi).rand, 0.4, 0.5);
    var cf = SinOsc.kr(fltrate, (2 * pi).rand, 1400, 2000);
    RLPF.ar(LFPulse.ar(Lag.kr(sq,0.05), 0, pwm, 0.1), cf, 1/15);
};
var a = LFNoise0.ar(LFNoise1.kr(0.3,6000,8000),[0.07,0.07]);
var x = Decay.ar(Impulse.ar(2), 0.15, a);
var g = [f.value(1,8,0.31,0.2), f.value(0,2,0.13,0.11)] + x;
var z = 0.4 * (CombN.ar(g, 0.375, 0.375, 5) + g.reverse);
var e = Env.linen(2, 56, 2);
z * EnvGen.kr(e,doneAction:2);
}
