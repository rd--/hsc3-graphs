// why supercollider (jmcc) #0

f = {var r = {Resonz.ar(Dust.ar(0.2,50),Rand(200.0,3200.0),0.003)}
    ;var s = Mix.ar(Array.fill(10,r))
    ;var z = DelayN.ar(s,0.048)
    ;var c = {CombL.ar(z,0.1,LFNoise1.kr(Rand(0,0.1),0.04,0.05),15)}
    ;var x = Mix.ar(Array.fill(7,c))
    ;4.do({x = AllpassN.ar(x,0.050,[Rand(0,0.05),Rand(0,0.050)],1)})
    ;s+(0.2*x)};

z = f.play;
z.trace;

"mk.scd".loadRelative;
~wr_scsyndef.("why-supercollider-rand.sc",f);

/* Rand -> .rand */

f = {var r = {Resonz.ar(Dust.ar(0.2,50),200 + 3000.0.rand,0.003)}
    ;var s = Mix.ar(Array.fill(10,r))
    ;var z = DelayN.ar(s,0.048)
    ;var c = {CombL.ar(z,0.1,LFNoise1.kr(0.1.rand,0.04,0.05),15)}
    ;var x = Mix.ar(Array.fill(7,c))
    ;4.do({x = AllpassN.ar(x,0.050,[0.050.rand,0.050.rand],1)})
    ;s+(0.2*x)}.play

z = f.play;
z.trace;

"mk.scd".loadRelative;
~wr_scsyndef.("why-supercollider.sc",f);

f.draw