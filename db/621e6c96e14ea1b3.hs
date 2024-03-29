-- tim walters ; <https://swiki.hfbk-hamburg.de/MusicTechnology/899> ; id
let mk (z0,k) =
      let x z f m j = sinOsc ar (f + (m * 4 * j)) m * (lfNoise1Id (z0,z) ar (((j + 1) / f) * 4)) / 2
          pp y (z,i) = x z (i * k * mce2 4 8) y i
          y0 = x 'α' 0.1 0 8
      in foldl pp y0 (zip ['β' ..] [0 .. 8])
in sum (map mk (zip ['γ'..] [0 .. 7])) / 4
