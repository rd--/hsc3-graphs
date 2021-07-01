-- iEnvGen ; index with sinOsc ; mouse controls amplitude ; offset negative values of SinOsc
let e = let l = [-1,-0.7,0.7,1]
            t = [0.8666,0.2666,0.8668]
            c = [EnvLin,EnvLin]
        in Envelope l t c Nothing Nothing (-1)
    x = mouseX kr 0 1 Linear 0.2
    o = (sinOsc ar 440 0) * x
in iEnvGen ar o e * 0.1
