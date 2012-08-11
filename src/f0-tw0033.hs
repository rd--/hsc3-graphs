-- www.fredrikolofsson.com/f0blog/?q=node/537

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.UGen.Protect

f0_0033 :: UGen
f0_0033 =
    let f = roundE (lfPar AR (1/14) 0) * 20 + 80
        a = pulse AR (mce [1..4]) 0.35
        n = uclone 'α' 4 (brownNoise 'α' AR) * a
        z i = mce2 (i + 1 * f) (i * f + (i + 1 / 3))
        o = lfPar AR (mce (map z [0..3])) 0
    in out 0 (splay ((o >* n) / 3) 1 1 0 True)

main :: IO ()
main = audition f0_0033
