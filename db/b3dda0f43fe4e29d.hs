-- tim walters ; <https://swiki.hfbk-hamburg.de/MusicTechnology/899>
let mk k =
      let x f m j = sinOsc ar (f + (m * 4 * j)) m * (lfNoise1 ar (((j + 1) / f) * 4)) / 2
          pp y i = x (i * k * mce2 4 8) y i
      in foldl pp (x 0.1 0 8) [0 .. 8]
in sum (map mk [0 .. 7]) / 4
