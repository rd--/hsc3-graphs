// synthetic piano (jmcc) #3
val n = 6;
Mix.fill(n){
  val pitch  = IRand.apply(lo = 36, hi = 89);
  val strike = Impulse.ar(freq = Rand.apply(0.1, 0.5), phase = Rand.apply(0, 1)) * 0.05;
  val hammerEnv = Decay2.ar(in = strike, attack = 0.008, release = 0.04);
  val genFunc = {(i:Int) =>
    val detune = Array.apply(-0.05, 0, 0.04).apply(i);
    val delayTime = 1 / (pitch + detune).midiCps;
    val hammer = LFNoise2.ar(freq = 3000) * hammerEnv;
    CombL.ar(in = hammer, maxDelayTime = delayTime, delayTime = delayTime, decayTime = 6)};
  val sig = Mix.tabulate(3)(genFunc);
  Pan2.ar(in = sig, pos = (pitch - 36) / 27 - 1, level = 1)}
