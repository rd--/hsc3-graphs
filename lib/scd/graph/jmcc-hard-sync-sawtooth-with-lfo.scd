// hard sync sawtooth with lfo (jmcc) #6 ; graph-rewrite
{var txt ={RTexture.overlapGraph(graphFunc:
 {arg tr
 ;var f = (30 + TRand.kr(0,50,tr)).midicps
 ;SyncSaw.ar([f, f + 0.2], SinOsc.kr(0.2, {TRand.kr(0,2 * pi,tr)} ! 2) * (2 * f) + (3 * f)) * 0.05}
 ,sustainTime:4, transitionTime:4, overlap:4)}.value
;CombN.ar(txt, 0.3, 0.3, 4, 1, txt.reverse)}
