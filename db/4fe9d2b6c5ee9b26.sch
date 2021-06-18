-- tim walters ; <https://swiki.hfbk-hamburg.de/MusicTechnology/899> ; edited for packet size
let f k i =
      let x = impulse ((0.5 ** i) / k) 0
      in sinosc i (sinosc ((i + k) ** i) 0 / (decay x [i, i + 1]) * k)
    s = mixfilloneindexed 8 (\k -> mixfill 6 (\i -> f k i))
in mix (mcetranspose (gverb s 1 3 0.5 0.5 15 1 0.7 0.5 300 / 512))
