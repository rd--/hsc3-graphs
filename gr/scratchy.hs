-- scratchy (jmcc) #1

import Sound.SC3.ID {- hsc3 -}

scratchy :: UGen
scratchy =
  let n = brownNoise 'α' AR * 0.5 - 0.49
      n' = uclone 'β' 2 n
  in rhpf (max n' 0 * 20) 5000 1

main :: IO ()
main = audition (out 0 scratchy)
