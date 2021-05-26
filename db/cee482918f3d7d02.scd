// f0 ; https://twitter.com/redFrik/status/1395519538008141835
{ar(LPF,tanh(sin(d=ar(HPF,ar(MantissaMask,c=ar(b=Duty,4e-3,0,Dseries(1,[1,2],i=inf)%ar(b,8.192,0,Dseq((1..6)*75,i)))),5))+ar(a=SinOscFB,63,(f=ar(a,_).max).(0.8),d)/9+ar(a,[250,200]*ar(b,4.096,0,Dseq([4,6,5,5,5,5,3]/4,i)).lag,f.(0.08),f.(1/[99,60])/3))/2,1e4)*0.1}
