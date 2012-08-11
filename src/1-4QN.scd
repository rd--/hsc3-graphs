// http://sccode.org/1-4QN

z = Buffer.alloc(s, 512, 1);
z.sine1(1.0 / [1, 2, 3, 4], true, true, true);

g =
 {arg o
 ;SynthDef("g1",
  {arg out=0,bufnum=0,dur=1,rate=1,pos=0,sdens=1,edens=1
  ;var dens = Line.kr(sdens,edens,dur)
  ;var t = o.ar(dens)
  ;var p = Env.perc(0.0001.rrand(0.1),dur * (0.5.rrand(4)))
  ;var env = EnvGen.kr(p,doneAction:2)
  ;var g = GrainBuf.ar(2,t,1 / dens,bufnum,rate,pos)
  ;Out.ar(out,g * env)}).add()};

b = Pbind(
	\instrument,\g1,
	\dur,Pseq([4],inf),
	\sdens,Pseq([9000,1000,500]/100,inf),
	\edens,Prand([Pseq([9000,1000,500]/10,1),Pseq([1],3)],inf),
	\rate,Pfunc({-10.0.rrand(10)}),
	\pos,Pfunc({-10.0.rrand(10)}),
	\bufnum,z.bufnum);

c = Pbind(
	\instrument,\g1,
	\dur,Pseq([4/3],inf),
	\sdens,Pseq([9000,1000,500,25],inf),
	\edens,Prand([Pseq([9000,1000,500,25],1),Pseq([1],4)],inf),
	\rate,Pfunc({-100.0.rrand(100)}),
	\pos,Pfunc({-10.0.rrand(10)}),
	\bufnum,z.bufnum);

fork({loop
 {var o = [LFNoise0,SinOsc,Impulse,LFPulse,LFSaw].choose
 ;g.value(o);[1,2,4,8,16,32].choose.postln.wait}});

[b,c].do({|p| p.play});
