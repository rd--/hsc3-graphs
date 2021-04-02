fork{loop{play{
f=_*3.pow(17.rand/13);
e=EnvGen.ar(Env.perc,1,0.3,0,1,2);
PMOsc.ar(f.value([438,442]),f.value(880),f.value(e))*e
};[1/6,1/3].choose.wait}}
