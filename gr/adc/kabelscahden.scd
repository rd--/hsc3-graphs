SynthDef(\kabelScahden,{
arg out,freq = 50,sustain = 1,amp = 1;
var h,n,m,k,trig,hum;
hum = {
 trig = Dust.kr(7 ** LFNoise1.kr(0.3));
 h = ToggleFF.kr(CoinGate.kr(0.4,trig)) * RLPF.ar(LFPulse.ar(freq,0,0.5,1,LFNoise1.kr(2,0.5,-0.5)),6000,0.15);
 n = Trig.ar(trig,TRand.kr(0,0.01,CoinGate.kr(0.4,trig))) * WhiteNoise.ar;
 m = Trig.ar(trig,TRand.kr(0,0.01,CoinGate.kr(0.4,trig))) * BrownNoise.ar;
 k = Trig.ar(trig,LFNoise1.kr([4,4.2],0.1,0.11)) * LFClipNoise.ar(LFNoise0.kr(7,30,40));
 LeakDC.ar(h + n + k + m * 10).distort;} ! 2;
Out.ar(out,hum.clip2 * EnvGen.kr(Env([amp,amp,0] * 0.5,[sustain,0]),doneAction: 2));
}).play;

// Local Variables:
// truncate-lines:t
// End:
