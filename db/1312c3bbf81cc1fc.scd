// PinkingFilterPk3
var amp = MouseX.kr(0.01, 0.1, 1, 0.2);
PinkingFilterPk3.ar(WhiteNoise.ar() * 0.1) * amp
