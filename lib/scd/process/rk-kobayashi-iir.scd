/*
	http://sites.music.columbia.edu/cmc/courses/g6611/spring2012/week2/index.html
	http://rtcmix.org/reference/scorefile/IIR.php
	http://rtcmix.org/reference/scorefile/maketable.php
	http://rtcmix.org/reference/scorefile/random.php
*/
var maybeRecip = {
	arg x;
	[x, 1 / x].choose
};
var genRatio = {
	arg o;
	maybeRecip.value([3/2, 4/3, 5/4, 6/5, o].choose)
};
var mkNode = {
	arg pitch, dur;
	var env = EnvGen.ar(Env.triangle(dur, 1), 1, 1, 0, 1, 2);
	var ratioSeq = [1] ++ 4.collect(genRatio.value(2));
	var widthSeq = 5.collect({ 1.0.rand + 0.001 });
	var ampSeq = [1.0, 0.9, 0.7, 0.5, 0.3];
	var sig = WhiteNoise.ar * env;
	5.collect({
		arg i;
		Resonz.ar(sig, pitch * ratioSeq[i], widthSeq[i] * 0.01) * ampSeq[i]
	}).sum
};
var pitch = 500;
{
        var dur = 1.0.rand * 2 + 1;
        {mkNode.value(pitch, dur)}.play;
        (dur / 3).wait;
        pitch = pitch * genRatio.value(1);
        if(pitch > 1200, {pitch = pitch / 2});
        if(pitch < 40, {pitch = pitch * 2});
}.loop
