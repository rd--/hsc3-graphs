f=0;
{inf.do{|i|
n=((((2*i)%6)+1)+floor(f))/((i%5)+1);
f=(f+log2(n))%2;
e=Line.kr(0.1,0,1,1,0,2);
play{SyncSaw.ar(2**f*99+[0,1],i%8+2*52)*e};
0.3.wait}}.r.play
