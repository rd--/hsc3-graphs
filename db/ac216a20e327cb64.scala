// harmonic zither (jmcc) #11
val pitch = Vector.apply(50, 53.86, 57.02, 59.69, 62, 64.04, 65.86, 67.51, 69.02, 71.69, 72.88, 74);
val mouseX = MouseX.kr(lo=0, hi=1, warp=0, lag=0.2);
val triggerSpacing = 0.5 / (pitch.size - 1);
val panSpacing = 1.5 / (pitch.size - 1);
val out = Mix.tabulate(pitch.size){i =>
  val trigger = HPZ1.kr(mouseX > (0.25 + (i * triggerSpacing))).abs;
  val pluck = PinkNoise.ar(Decay.kr(trigger, 0.05));
  val period = pitch.apply(i).midiCps.reciprocal;
  val string = CombL.ar(pluck, period, period, 8);
  Pan2.ar(string, i * panSpacing - 0.75)};
LeakDC.ar(out)
