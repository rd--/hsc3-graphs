// https://github.com/pangrus/hachi/blob/master/lib/engine_hachi.sc ; yh (yoshinosuke horiuchi)
var decay = 0.42;
var amp = 1;
var pan = 0;
var tr = Impulse.kr(LFNoise2.kr(1) + 1.5, 0);
var env = Env.perc(0.005, decay, 1, -30).kr(0, tr);
var osc1 = LFPulse.ar(203.52);
var osc2 = LFPulse.ar(366.31);
var osc3 = LFPulse.ar(301.77);
var osc4 = LFPulse.ar(518.19);
var osc5 = LFPulse.ar(811.16);
var osc6 = LFPulse.ar(538.75);
var osc = (osc1 + osc2 + osc3 + osc4 + osc5 + osc6);
var sighi = HPF.ar(BPF.ar(osc, 8900, 1), 9000);
var siglow = BHiPass.ar(BBandPass.ar(osc, 8900, 0.8), 9000, 0.3);
var sig = BPeakEQ.ar((siglow + sighi), 9700, 0.8, 0.7);
Pan2.ar(sig * env, pan, amp)
