// harmonic zither (jmcc) #11

{var pitch = [50,53.86,57.02,59.69,62,64.04,65.86,67.51,69.02,71.69,72.88,74]
;var mousex = MouseX.kr
;var mousey = MouseY.kr
;var triggerSpacing = 0.5 / (pitch.size - 1)
;var panSpacing = 1.5 / (pitch.size - 1)
;var out = Mix.arFill(pitch.size,
 {arg i
 ;var trigger = HPZ1.kr(mousex > (0.25 + (i * triggerSpacing))).abs
 ;var pluck = PinkNoise.ar(Decay.kr(trigger,0.05))
 ;var period = pitch.at(i).midicps.reciprocal
 ;var string = CombL.ar(pluck,period,period,8)
 ;Pan2.ar(string,i * panSpacing - 0.75)})
;LeakDC.ar(LPF.ar(out,12000))}.play
