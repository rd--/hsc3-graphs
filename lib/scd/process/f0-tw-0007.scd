// https://sccode.org/1-4Qy ; f0 ; 0007
{
	{
		var o = Pluck.ar(Crackle.ar([1.9, 1.8]), Impulse.ar(5.rand + 1, 0), 0.05, 0.05.linrand, 1, 0.5);
		Release.ar(BPF.ar(o, 1200.rand, 1), 9, 0, 69)
	}.play;
	9.wait;
}.loop

// https://sccode.org/1-4S6 ; f0 ; 'm'
{
	{
		{
			var o= Pluck.ar(Crackle.ar([1.9, 1.8]), Mix(Impulse.ar({ 5.linrand + 1 }.dup(2), -0.125)), 0.05, 0.05.linrand, 1, 0.5);
			Release.ar(BPF.ar(o, 2000.rand + 100, 0.25.rrand(1.75)), 18, 0, 69)
		}.play;
		18.wait;
	}.loop
}.fork;
{ InFeedback.ar(62, 2) * SinOsc.kr(0.006, 0).range(0.25, 1) * 0.5 }.play

//----tweet0007
r{loop{x={BPF.ar(Pluck.ar(Crackle.ar([1.9,1.8]),Impulse.ar(5.rand+1),0.05,0.05.linrand),1200.rand)}.play(s,0,9);wait(9);x.release(69)}}.play
