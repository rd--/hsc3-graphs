// alien froggies (jmcc) #1
{RTexture.overlapGraph({
    arg tr;
    var rate = 11;
    var r = (rate * TRand.kr(-0.2,0.2,tr).exp).fold(1,30); // bilinrand
    Formant.ar(r,TExpRand.kr(200,3000,tr),TRand.kr(0,9,tr) * r + r,0.05);
},sustainTime:0.5,transitionTime:0.25,overlap:5)}
