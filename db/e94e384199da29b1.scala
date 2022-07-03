// chrd (rd) ; texture=overlap,21,0,3,inf
val chrd = (m:GE) => {
  val r1 = Rand.apply(lo = 0.15, hi = 0.35);
  val r2 = Rand.apply(lo = 0.005, hi = 0.01);
  val ds = 3;
  val d = Seq.apply(5, 4, 5, 7, 4, 5).map(x => x * ds);
  val f = XLine.kr(start = m, end = Rand.apply(lo = 0.05, hi = 0.5) + m, dur = d, doneAction = 0).midiCps;
  val z = Env.sine(dur = d.max, level = r2);
  val e = EnvGen.kr(envelope = z, gate = 1, levelScale = 1, levelBias = 0, timeScale = 1, doneAction = 0);
  val p = XLine.kr(start = Rand.apply(lo = -1, hi = 1), end = Rand.apply(lo = -1, hi = 1), dur = d, doneAction = 0);
  val o = SinOsc.ar(freq = f, phase = 0);
  Mix.apply(Pan2.ar(in = o, pos = p, level = e));
};
val scale = Seq.apply(0, 2, 4, 5, 7, 9, 11);
val octaves = Seq.apply(4, 5, 6, 7);
val mnn = scale.map(n => octaves.map(o => n + o * 12)).flatten;
val chd = Seq.fill(6)({Select.kr(index = IRand.apply(lo = 0, hi = mnn.size), in = mnn)});
Mix.fill(9)({chrd(chd)});
