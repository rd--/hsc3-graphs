// <https://swiki.hfbk-hamburg.de/MusicTechnology/899> (tw ; tim walters)
val s =
  Mix.tabulate(16){k =>
    Mix.tabulate(6){i =>
      val t = Impulse.kr(freq = (0.5 pow i) / k, phase = 0);
      val d = Decay.kr(in = t, time = Seq.apply(i, i + 1)) * k;
      val ph = SinOsc.ar(freq = (i + k) pow i, phase = 0) / d;
      SinOsc.ar(freq = i, phase = ph)}};
GVerb.ar(in = s, roomSize = 1) / 512
