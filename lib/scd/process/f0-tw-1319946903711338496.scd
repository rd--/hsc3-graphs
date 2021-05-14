// https://twitter.com/redFrik/status/1319946903711338496
fork{
 inf.do{
  a={
   |i|
   c=Scale.minor.tuning_(Tuning.mean5);
   o=LFTri;
   d=9.rand;
   z=sum({y=ar(SinOscFB,kr(o,1/99)*9+midicps(12*(3..6).choose+c[c.degrees.choose]),kr(o,1+i/50)+1/2);
          ar(Pan2,y,kr(o,i/70))/2}!d);
   ar(CombN,z).tanh}.play(s,0,9);
   wait(d*9+3);
   a.release(12)
 }
}
