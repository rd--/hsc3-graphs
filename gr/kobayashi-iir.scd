/*

http://sites.music.columbia.edu/cmc/courses/g6611/spring2012/week2/index.html

http://rtcmix.org/reference/scorefile/IIR.php
http://rtcmix.org/reference/scorefile/maketable.php
http://rtcmix.org/reference/scorefile/random.php

*/

(
var maybe_recip = {arg x; [x, 1/x].choose};
var gen_ratio = {arg o; maybe_recip.([3/2,4/3,5/4,6/5,o].choose)};
var mk_node = {
    arg pitch, dur;
    var env = EnvGen.ar(Env.triangle(dur,1),1,1,0,1,2);
    var ratio_seq = [1] ++ 4.collect(gen_ratio.(2));
    var width_seq = 5.collect({1.0.rand + 0.001});
    var amp_seq = [1.0,0.9,0.7,0.5,0.3];
    var sig = WhiteNoise.ar * env;
    var flt = 5.collect({arg i; Resonz.ar(sig,pitch * ratio_seq[i],width_seq[i] * 0.01) * amp_seq[i]});
    flt.sum;
};
Routine({
    var pitch = 500;
    inf.do({
        var dur = 1.0.rand * 2 + 1;
        {mk_node.(pitch,dur)}.play;
        (dur / 3).wait;
        pitch = pitch * gen_ratio.(1);
        if(pitch > 1200,{pitch = pitch / 2});
        if(pitch < 40,{pitch = pitch * 2});
    });
}).play
)
