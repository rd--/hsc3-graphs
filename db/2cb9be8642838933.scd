// https://swiki.hfbk-hamburg.de/MusicTechnology/899 (nv) L43
{var p=Impulse;mean({|i|Pluck.ar(LFSaw.ar([102,101]),x=p.ar(1,i/10)+p.ar(0),1,1/Latch.ar(1.015**Sweep.ar(0,1)*64%1+1*200,x),4,0.2)}!10)}
