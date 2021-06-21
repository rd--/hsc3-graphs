// https://scsynth.org/t/phaseshaping-osc-algorithms/3926/7 ; sp ; mouse control
{arg buf = 10
;var width = MouseX.kr().clip(0.1,0.9)
;var freq = MouseY.kr(200, 1000)
;var sawLin = LFSaw.ar(freq/2, 1).linlin(-1,1, width.neg, 1-width)
;var saw = sawLin.bilin(0, width.neg, 1-width, 0, -0.5, 1)
;var sine = (Select.ar(saw>0, [0.5+saw, saw])*2pi).sin
;var shaper = Shaper.ar(buf, sine, 0.5)
;Pan2.ar(shaper, 0, 0.1)}
