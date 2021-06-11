-- tim walters ; <https://swiki.hfbk-hamburg.de/MusicTechnology/899> ; edit for packet size
let mk k =
      let x f m j = sinosc (f + (j * 4 * m)) m * (lfnoise1 (((j + 1) / f) * 4)) / 2
          pp y i = x ([i * 4 * k, i * 8 * k]) y i
      in foldl pp (x 0.1 0 8) [0, 2 .. 8]
in foldl1 (+) (map mk [0, 2 .. 8]) / 4
