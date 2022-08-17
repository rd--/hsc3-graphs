// LoopSet ; two sets of two loops ; whole and center half ; requires=buf
var buf = 10;
var i = BufRateScale.kr(buf) * [2/3, 1];
LoopSet.ar(buf, 0, 1, 0.1, i, [0, 1, 1, 1, 1/4, 3/4, 2, 1/2])
