-- seqr (rd)

import Sound.SC3.ID

nfreq :: ID a => a -> Int -> UGen -> UGen -> [UGen]
nfreq z n l r = map (midiCPS . floorE) (uclone' z n (rand z l r))

seqr_f :: UGen -> [UGen] -> UGen
seqr_f f e =
    let n = constant (length e `div` 2)
    in select (lfSaw KR f 0 * n + n) (mce e)

seqr :: Int -> UGen
seqr n =
  let f = rand 'a' 9 18 / constant n
      b = blip AR (mce2 (seqr_f f (nfreq 'a' n 72 96))
                        (seqr_f f (nfreq 'b' n 72 84)))
                  (mce2 (seqr_f f (uclone' 'c' n (rand 'c' 1 3)))
                        (seqr_f f (uclone' 'd' n (rand 'd' 3 6))))
      a = mce2 (seqr_f f (uclone' 'e' n (rand 'e' 0.05 0.10)))
               (seqr_f f (uclone' 'f' n (rand 'f' 0.05 0.15)))
  in b * a


-- n = rand 6 18
main :: IO ()
main = audition (out 0 (seqr 12))
