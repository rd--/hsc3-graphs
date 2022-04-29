// bidirectional strummable guitar (jmcc) #11
var pitch1 = #[52, 57, 62, 67, 71, 76];
var pitch2 = pitch1 + 7;
var mousex = MouseX.kr(0, 1, 0, 0.2);
var out = Mix.arFill(pitch1.size, {
    arg i;
    var trigger = HPZ1.kr(mousex > (0.25 + (i * 0.1)));
    var pluck1 = PinkNoise.ar(Decay.kr(trigger.max(0), 0.05));
    var period1 = pitch1.at(i).midicps.reciprocal;
    var string1 = CombL.ar(pluck1, period1, period1, 4);
    var pluck2 = BrownNoise.ar(Decay.kr(trigger.neg.max(0), 0.05));
    var period2 = pitch2.at(i).midicps.reciprocal;
    var string2 = CombL.ar(pluck2, period2, period2, -4);
    Pan2.ar(string1 + string2, i * 0.2 - 0.5)
});
LeakDC.ar(LPF.ar(out, 12000))

//---- bidirectional strummable guitar (jmcc) #11
{var pitch1 = #[52,57,62,67,71,76]
;var pitch2 = pitch1 + 7
;var mousex = MouseX.kr(minval: 0, maxval: 1, warp: 0, lag: 0.2)
;var out = Mix.arFill(pitch1.size,
 {arg i
 ;var trigger = HPZ1.kr(in: mousex > (0.25 + (i * 0.1)))
 ;var pluck1 = PinkNoise.ar(mul: Decay.kr(in: trigger.max(0), decayTime: 0.05))
 ;var period1 = pitch1.at(i).midicps.reciprocal
 ;var string1 = CombL.ar(in: pluck1, maxdelaytime: period1, delaytime: period1, decaytime: 4)
 ;var pluck2 = BrownNoise.ar(mul: Decay.kr(in: trigger.neg.max(0), decayTime: 0.05))
 ;var period2 = pitch2.at(i).midicps.reciprocal
 ;var string2 = CombL.ar(in: pluck2, maxdelaytime: period2, delaytime: period2, decaytime: -4)
 ;Pan2.ar(in: string1 + string2, pos: i * 0.2 - 0.5, level: 1)})
;LeakDC.ar(in: LPF.ar(in: out, freq: 12000),coef: 0.995)}
