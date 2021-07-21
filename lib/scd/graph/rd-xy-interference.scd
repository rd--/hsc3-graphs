// xy interference
{var x, y, nd
;x = MouseX.kr(20,22000,'linear',#[0.005,0.025])
;y = MouseY.kr(20,22000,'linear',#[0.005,0.075])
;nd = {var n, a, b
      ;n = LFNoise0.kr([5,9])
      ;a = SinOsc.ar(x + n,0)
      ;b = SinOsc.ar(y,0)
      ;a * b}
;Mix.fill(3,nd)}
