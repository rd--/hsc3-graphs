// https://scsynth.org/t/share-your-delay-reverb-designs/2206 (mk) ; warning=feedback
arg delay = 0.1, delayfb = 0.33, decaytime = 0.5, delaywidth = 0.1, modFreq = 0.1, modAmount = 0.25, fblowcut = 0.5;
var input = SoundIn.ar([0,1]);
var numChans = 2;
var localIn = LocalIn.ar(numChannels: numChans,  default: 0.0);
var output = Array.fill(numChans, {
    arg cNum;
    var randScale = Rand.ir(0.95,1.0); // random scalar to add variation
    var delayScale = if(cNum.even, {delaywidth.linlin(0.0,1.0,0.5,1.5)}, {1.0}); // every other channel, scale delay
    var delayVal = lag3(delayScale * randScale * delay.linlin(0.0,1.0,0.0001,2.0)); // final, scaled delay value
    var phase = cNum.linlin(0, numChans - 1,-8pi, 8pi); // delaytime modulator
    var lfofreq = (randScale * modFreq.linexp(0.0,1.0,0.0001,10.0)).lag3;
    var minModamount = modAmount.linlin(0.0,1.0,1.0,0.001).lag * delayVal;
    var delayValSig = LFTri.kr(Rand.ir(0.99,1.0) * lfofreq,phase).linlin(-1.0,1.0, minModamount, delayVal);
    var fb0 = (delayfb * 1.1 * localIn.at(cNum)).tanh; // tanh for "limiting"
    var fb1 = DelayL.ar(fb0, 0.2, delaytime: Rand.ir(0.1, 0.2)); // avoid phase problems that sound "flat"
    var fb2 = LPF.ar(fb1, Rand.ir(0.99,1.0)*fblowcut.linexp(0.0,1.0,40.0,12000.0));
    var sig = AllpassC.ar(input[cNum] + fb2, 2, delayValSig, decaytime.linlin(0.0,1.0, 0.1,3.0).lag3); // final delay
    LeakDC.ar(sig)
});
LocalOut.ar(output);
output
