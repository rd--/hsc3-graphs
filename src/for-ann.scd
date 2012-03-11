{{{var d = 33.6
  ;var f0 = 40
  ;var f1 = 40 * (2**8)
  ;var f_e = Env.new([f0,f1],[d],\exp)
  ;var f = EnvGen.ar(f_e,1,1,0,1,0)
  ;var a_e = Env.linen(d/4,d/2,d)
  ;var a = EnvGen.ar(a_e,1,0.1,0,1,2)
  ;Pan2.ar(SinOsc.ar(f,0,a))}.play
 ;2.8.wait}!240}.fork
