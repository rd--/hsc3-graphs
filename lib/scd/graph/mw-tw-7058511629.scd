// https://twitter.com/marcuswrango/status/7058511629 ; rewrite (rd)
var x = { LFNoise0.ar(0.1) } ! 2 * 2.5 + 3.5;
GVerb.ar(
	{
		LatoocarfianL.ar(SampleRate.ir() / 2 + IRand.ir(0, 16), x, x, x, x, 0.5, 0.5)
	}.dup(24).sum,
	9 + x,
	9 * x
) / 5000

//---- https://twitter.com/marcuswrango/status/7058511629
GVerb.ar(x=LFNoise0.ar(0.1!2,2.5,3.5);SplayAz.ar(2,LatoocarfianL.ar(SampleRate.ir/2+16.rand,x,x,x,x)!66,x),9+x,9*x)*0.001
