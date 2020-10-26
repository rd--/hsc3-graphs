import Sound.SC3.Common {- hsc3 -}
import Sound.SC3.UGen.M {- hsc3-m -}

scratchy :: UGen
scratchy =
  let dup2 x = mce2 x x
      f = max (dup2 (brownNoise AR) * 0.5 - 0.49) 0 * 20
  in rhpf f 5000 1

main :: IO ()
main = audition_st scratchy
