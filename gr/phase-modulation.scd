// phase modulation with slow beats (jmcc) #6

"overlap-texture.scd".loadRelative;

~overlap_texture.({
	var x = MouseX.kr(100, 6000, 'exponential'); // random freq of new events
	var y = MouseY.kr(0, 2); // modulation index
    var a = 0;
    3.do({
        f = Rand(0,x);
        a = FSinOsc.ar([f, f + 1.0.rand2], 0, y, a);
    });
    f = Rand(0,x);
    SinOsc.ar([f, f+1.0.rand2], a, 0.1)
}, 4, 4, 4);
