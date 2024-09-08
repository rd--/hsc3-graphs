-- tim walters ; <https://swiki.hfbk-hamburg.de/MusicTechnology/899> ; edited for packet size
let f k i =
      let x = Impulse ((0.5 ** i) / k) 0
      in SinOsc i (SinOsc ((i + k) ** i) 0 / (Decay x [i, i + 1]) * k)
    s = mixFillOneIndexed 8 (\k -> mixFill 6 (\i -> f k i))
in Mix (Transpose (GVerb s 1 3 0.5 0.5 15 1 0.7 0.5 300 / 512))
