-- scratchy (jmcc)

import Sound.SC3.ID {- hsc3 -}

scratchy :: UGen
scratchy =
  let f m = brownNoise m AR * 0.5 - 0.49
      n = mce2 (f 'α') (f 'β')
  in rhpf (max n 0 * 20) 5000 1

main :: IO ()
main = audition (out 0 scratchy)
