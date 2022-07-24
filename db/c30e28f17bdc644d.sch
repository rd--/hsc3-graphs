-- https://swiki.hfbk-hamburg.de/MusicTechnology/899 (nv) [Line 41]
let n i =
      let f = 1.9 ** i / 128
          p = [PinkNoise (), PinkNoise ()]
          b = 4 ** LFNoise2 (1.2 ** i / 16)
      in BPF p (b * 300) 0.15 * (5 ** LFNoise2 f / (i + 8) * 20)
in Splay (mixFill 15 n) 1 0.5 0 True
