// ring modulate & echo input ; jmcc #5
var in = AudioIn.ar([1, 2]) * 0.4 * SinOsc.ar(MouseX.kr(10, 2000, 1, 0.2), [0, 0.5 * pi]);
CombL.ar(in, 0.5, MouseY.kr(0, 0.5, 0, 0.2), 4) + in

//---- notes.md
_MouseX_ controls ring modulator frequency.

_MouseY_ controls delay time.

The time for the echo to decay by 60 dB is four seconds.
