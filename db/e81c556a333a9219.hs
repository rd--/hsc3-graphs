-- iEnvGen
let e = let l = [0,0.6,0.3,1.0,0]
            t = [0.1,0.02,0.4,1.1]
            c = [EnvLin,EnvExp,EnvNum (-6),EnvSin]
        in Envelope l t c Nothing Nothing 0
    x = mouseX kr 0 (envelope_duration e) Linear 0.2
    g = iEnvGen kr x e
in sinOsc ar (g * 500 + 440) 0 * 0.1
