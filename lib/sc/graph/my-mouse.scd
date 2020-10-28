// https://mohayonao.github.io/CoffeeCollider/#mouse.coffee
{var freq = MouseY.kr(100, 1000, 'exponential')
;var freq1 = freq * MouseX.kr(2, 0.5, lag:2.5)
;var freq2 = freq * MouseX.kr(0.5, 2, lag:2.5)
;var feedback = MouseButton.kr(0, pi, lag:5)
;SinOscFB.ar([freq1, freq2], feedback, mul:0.1)}.play
