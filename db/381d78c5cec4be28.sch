-- tim walters ; <https://swiki.hfbk-hamburg.de/MusicTechnology/899> ; edit for packet size
let mk k =
      let x f m j = sinosc (f + (m * 4 * j)) m * (lfnoise1 (((j + 1) / f) * 4)) / 2
          pp y i = x ([i * k * 4, i * k * 8]) y i
      in foldl pp (x 0.1 0 8) [0 .. 8]
in foldl1 (+) (map mk [0 .. 4]) / 4
