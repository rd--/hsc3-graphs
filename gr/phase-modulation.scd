// phase modulation with slow beats (jmcc) #6

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~overlap_texture.({
	var x = MouseX.kr(100, 6000, 'exponential'); // random freq of new events
	var y = MouseY.kr(0, 2); // modulation index
    var a = 0;
    3.do({
        f = IRand(0,x);
        a = FSinOsc.ar([f, f + 1.0.rand2], 0, y, a);
    });
    f = IRand(0,x);
    SinOsc.ar([f, f+1.0.rand2], a, 0.1)
}, 4, 4, 4);
