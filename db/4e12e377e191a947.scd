// ln 2021-04-16 https://lukasnowok.github.io/spectrology/
{var trig = Impulse.ar(XLine.ar(1, 1000, 20))
;Saw.ar(TRand.ar(50, XLine.ar(50,5000,20), trig)) * EnvGen.ar(Env.perc(0,0.1), trig) * 0.1}
