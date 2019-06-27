// contamination zone (jmcc) #9

"overlap-texture.scd".loadRelative;

~overlap_texture.(
{var f = exprand(800,8000)
;var pan = LFNoise1.kr(1.0.rand)
;var amp = LFPulse.kr(15.0.linrand,0,0.2 + 0.2.rand)
;var spc = [Array.rand(4,50.0,2000.0),nil,Array.rand(4,0.2,4.0)]
;var exc = PinkNoise.ar(LFNoise1.kr(3.0.rand,0.0008,0.0022))
;var sig = Klank.ar(`spc,exc).abs * #[-1,1].choose
;var flt = RLPF.ar(sig,SinOsc.kr(1.0.linrand,0,0.7 * f,f),0.1)
;Pan2.ar(flt,pan,amp)}
,8,3,4,postProcess:
 {arg z
 ;6.do({ z = AllpassN.ar(z,0.1,[0.05.rand,0.05.rand],4)})
 ;z})
