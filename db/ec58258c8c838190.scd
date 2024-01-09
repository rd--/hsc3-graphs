// https://github.com/pangrus/hachi/blob/master/lib/engine_hachi.sc ; yh (yoshinosuke horiuchi)
var decay = 0.5;
var amp = 1;
var  pan = 0;
var tr = Impulse.kr(LFNoise2.kr(1) + 1.5, 0);
var env1 = Env.perc(0.1, decay, 1, -3).kr(0, tr);
var env2 = Env.new([0, 1, 0], [0, decay * 5], -150).kr(0, tr);
var osc1 = LFPulse.ar(203.52) * 0.6;
var osc2 = LFPulse.ar(366.31) * 0.6;
var osc3 = LFPulse.ar(301.77) * 0.6;
var osc4 = LFPulse.ar(518.19) * 0.6;
var osc5 = LFPulse.ar(811.16) * 0.6;
var osc6 = LFPulse.ar(538.75) * 0.6;
var osc = osc1 + osc2 + osc3 + osc4 + osc5 + osc6;
var sig1 = BPF.ar(BLowShelf.ar(osc, 990, 2, -3), 7700);
var sig2 = BPeakEQ.ar(sig1, 7200, 0.5, 5);
var sig3 = BHiPass4.ar(sig2, 8100, 0.7);
var sig4 = BHiShelf.ar(sig3, 9400, 1, 5);
var siga = sig4 * env1 * 0.6;
var sigb = sig4 * env2;
var sum = LPF.ar(siga + sigb, 4000);
Pan2.ar(sum, pan, amp * 2)
