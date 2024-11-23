// https://scsynth.org/t/6374/8
var sf = SfAcquire("Floating", 1, [1]);
var sfDur = SfDur(sf);
var numSlices = 8;
var positionsInBuf = numSlices.collect({ arg n; n / numSlices });
var timeOfEachSlice = sfDur * numSlices.reciprocal;
var lerpFactor = MouseX.kr(-1, 1, 0, 0.2);
var lerp = XFade2.kr(0, positionsInBuf, lerpFactor, 1);
var triggerPerLoop = Impulse.kr((lerp.last * sfDur).max(timeOfEachSlice).reciprocal, 0);
var delayTime = lerp * sfDur;
var triggerForSlice = DelayN.kr(triggerPerLoop, sfDur, delayTime);
var snd = GrainBuf.ar(1, triggerForSlice, timeOfEachSlice, sf, 1, positionsInBuf, 2, 0, -1, 512);
snd.sum * 0.25
