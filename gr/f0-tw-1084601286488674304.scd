// https://twitter.com/redFrik/status/1084601286488a674304

play{LocalOut ar:d=MoogFF.perform(\ar,PitchShift.perform(\ar,LocalIn ar:2,1.5,0.5)+Splay.perform(\ar,VarSaw.perform(\ar,(a=LFSaw.perform(\ar,_)).(1/b=[2,5,1,6,3])>0/4+1.25**b*99,0,a.(b/9)%1)*HPF.perform(\ar,a.(a.(1/b).round+1/2)>0,a.(b/33)*4+8)),a.(1/9)+2*4e3);d}
