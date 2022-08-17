// bowed garage door springs (jmcc) #9
{
	var spc = [Array.rand(4,50.0,2000.0),nil,Array.rand(4,0.2,12.0)];
	var exc = PinkNoise.ar(LFNoise1.kr(3.0.rand,0.0008,0.0022));
	var sig = Klank.ar(`spc,exc).abs * [-1,1].choose;
	var z = Pan2.ar(sig,LFNoise1.kr(1.0.rand));
	6.do({ z = AllpassN.ar(z,0.040,[0.040.rand,0.040.rand],16) });
	z
}.overlap(8, 3, 4)
