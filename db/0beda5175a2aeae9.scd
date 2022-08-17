// DFM1 ; mouse control
DFM1.ar(PinkNoise.ar() * 0.2, MouseX.kr(80, 5000, 1, 0.2), MouseY.kr(0.1, 1.2, 0, 0.2), 2, 0, 0.0003)
