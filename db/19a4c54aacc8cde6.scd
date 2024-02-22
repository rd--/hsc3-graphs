// random sine waves (jmcc) #1 ; texture=spawn,0.75,inf
Pan2.ar(FSinOsc.ar(Rand(0, 2000), 0), Rand(-1, 1), EnvGen.kr(Env.linen(2, 5, 2), 1, 0.02, 0, 1, 2))
