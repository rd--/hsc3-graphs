-- sinOsc ; ln 2021-04-17 https://lukasnowok.github.io/spectrology/
let geom k z m = mce (take k (iterate (* m) z))
    mkenv l t = envGen AR 1 1 0 1 DoNothing (envelope l t [EnvSin,EnvSin])
    o1 = mix (sinOsc AR (geom 10 1000 1.4) 0 * mkenv [1,0,1] [10,10]) * 0.2
    o2 = mix (sinOsc AR (geom 10 800 1.4) 0 * mkenv [0,1,0] [10,10]) * 0.2
    o3 = pulse AR (1/4) 0.5
in (o1 + o2 + o3) * 0.1
