// BLowPass4 ; compare to nested BLowPass
var n = WhiteNoise.ar();
var x = MouseX.kr(10, 20000, 1, 0.2);
var y = MouseY.kr(0.1, 1, 0, 0.2);
[BLowPass4.ar(n, x, y), BLowPass.ar(BLowPass.ar(n, x, y.sqrt), x, y.sqrt)] * 0.25
