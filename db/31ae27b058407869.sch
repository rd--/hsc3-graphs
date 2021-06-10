-- https://swiki.hfbk-hamburg.de/MusicTechnology/899 (nv) [Line 41]
let n i =
      let f = 1.9 ** i / 128
          p = [pinknoise (),pinknoise ()]
          b = 4 ** lfnoise2 (1.2 ** i / 16)
      in bpf p (b * 300) 0.15 * (5 ** lfnoise2 f / (i + 8) * 20)
in splay (mixfill 15 n) 1 0.5 0 true
