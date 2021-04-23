// ln 2021-04-10 https://lukasnowok.github.io/spectrology/
{RHPF.ar(WhiteNoise.ar * EnvGen.ar(Env([0,1,1,0], [0, 0.01, 0]), Impulse.ar(7)), 800, 0.05) + SinOsc.ar(6400, 0, 0.2) * 0.1}
