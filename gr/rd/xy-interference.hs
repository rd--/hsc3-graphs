-- xy-interference (rd, 2006-10-28)

import Sound.SC3 {- hsc3 -}
import Sound.SC3.UGen.Protect {- hsc3-rw -}

-- > synthstat_wr xy_interference
xy_interference :: UGen
xy_interference =
  let x = mouseX KR 20 22000 Linear (mce2 0.005 0.025)
      y = mouseY KR 20 22000 Linear (mce2 0.005 0.075)
      nd = let n = lfNoise0 'α' KR (mce2 5 9)
               a = sinOsc AR (x + n) 0
               b = sinOsc AR y 0
           in a * b
  in mix (uclone_all 'β' 3 nd)

xy_interference_m :: UId m => m UGen
xy_interference_m = do
  let x = mouseX KR 20 22000 Linear (mce2 0.005 0.025)
      y = mouseY KR 20 22000 Linear (mce2 0.005 0.075)
      nd = do n <- lfNoise0M KR (mce2 5 9)
              let a = sinOsc AR (x + n) 0
                  b = sinOsc AR y 0
              return (a * b)
  fmap sum_opt (sequence (replicate 3 nd))

-- > synthstat_wr xy_interference'
xy_interference' :: UGen
xy_interference' = uid_st_eval xy_interference_m

main :: IO ()
main = audition (out 0 xy_interference)
