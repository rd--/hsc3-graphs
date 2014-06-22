// pm-crotale (dmc) #1.7

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~spawn.(
{var midi = IRand(48,72)
;var tone = Rand(1,6)
;var art = Rand(2,6)
;var amp = Rand(0.1,0.3)
;var pan = Rand(-1,1)
;var freq = midi.midicps
;var env = Env.perc(0,art)
;var mod = 5 + (1 / IRand(2,6))
;var amp_1 = EnvGen.kr(env,1,0.3,0,art,0)
;var amp_2 = EnvGen.kr(env,1,Rand(0.1,0.5),0,1.3 * art,2)
;var sig = PMOsc.ar(freq,mod * freq,EnvGen.kr(env,1,tone,0,art,0),0)
;Pan2.ar(sig,pan,amp_1 * amp_2)},{rrand(0.25,4)});

// the graph as given in the book is odd.
// amp_1 is applied pre pan2, amp_2 is applied post.
