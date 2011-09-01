-- one-line (lance putnam)

import Sound.SC3

one_line :: UGen
one_line =
  let lfs = lfSaw AR (mce2 1 0.99) (mce2 0 0.6) * 2000 + 2000
      lfs_t = trunc lfs (mce2 400 600) * mce2 1 (-1)
      f = onePole (mix lfs_t) 0.98
  in pan2 (sinOsc AR f 0) 0 0.1

main :: IO ()
main = audition (out 0 one_line)

