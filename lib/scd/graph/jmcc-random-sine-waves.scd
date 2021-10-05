// random sine waves (jmcc) #1 ; texture=spawn,0.75,inf
{var env = Env.linen(2, 5, 2)
;var osc = FSinOsc.ar(Rand.ir(0, 2000),0,EnvGen.kr(env, doneAction:2, levelScale:0.02))
;Pan2.ar(osc,Rand.ir(-1, 1))}
