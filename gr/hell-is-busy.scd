// hell is busy (jmcc) #1

"overlap-texture.scd".loadRelative;

~overlap_texture.({
    var n = 8; /* number of simultaneous events */
    var e = LFPulse.kr(1+10.0.rand, 0, 0.7.rand, 0.04); /* amplitude envelope */
    Pan2.ar(FSinOsc.ar(400+2000.0.rand, 0, e),1.0.rand2)
}, 4, 4, 8)
