// https://sccode.org/1-4Qy ; f0 ; 0101
var c = 1;
{
	var x = {
		var a = DelayN.ar(InFeedback.ar(0, 2), 1, 1);
		c = c % 8 + 1;
		SinOsc.ar(c * 99 + [0, 2], a.reverse) / 4
	}.play;
	(9 - c).wait;
	x.release(16)
}.loop

//----tweet0101
r{loop{x=play{c=c?1%8+1;a=DelayN.ar(InFeedback.ar(0,2),1,1);SinOsc.ar(c*99+[0,2],a[1..0])/4};wait(9-c);x.release(16)}}.play
