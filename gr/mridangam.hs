-- mridangam (jmcc) #SPE3

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Lang.Pattern.Bind as P {- hsc3-lang -}
import qualified Sound.SC3.Lang.Random.ID as R {- hsc3-lang -}

mridangam :: UGen
mridangam =
    let a = tr_control "amp" 1
        n = whiteNoise 'α' AR * 70
        e = decay2 a 0.002 0.1
    in distort (resonz (n * e) (midiCPS 60) 0.02 * 4) * 0.4

drone :: UGen
drone =
    let s1 = saw AR (midiCPS (mce2 60 60.04))
        s2 = saw AR (midiCPS (mce2 67 67.04))
    in lpf (s1 + s2) (midiCPS 108) * 0.007

lseq :: [a] -> Int -> [a]
lseq l n = concat (replicate n l)

lrand :: Enum e => e -> [[a]] -> Int -> [a]
lrand e l n = concat (R.nchoose e n l)

a_seq :: Fractional n => Char -> [[n]]
a_seq e =
    [lseq [0.0] 10
    -- intro
    ,lseq [0.9,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0] 2
    ,lseq [0.9,0.0,0.0,0.2,0.0,0.0,0.0,0.2,0.0,0.0] 2
    ,lseq [0.9,0.0,0.0,0.2,0.0,0.2,0.0,0.2,0.0,0.0] 2
    ,lseq [0.9,0.0,0.0,0.2,0.0,0.0,0.0,0.2,0.0,0.2] 2
    -- solo
    ,lrand e [[0.9,0.0,0.0,0.7,0.0,0.2,0.0,0.7,0.0,0.0]
             ,[0.9,0.2,0.0,0.7,0.0,0.2,0.0,0.7,0.0,0.0]
             ,[0.9,0.0,0.0,0.7,0.0,0.2,0.0,0.7,0.0,0.2]
             ,[0.9,0.0,0.0,0.7,0.2,0.2,0.0,0.7,0.0,0.0]
             ,[0.9,0.0,0.0,0.7,0.0,0.2,0.2,0.7,0.2,0.0]
             ,[0.9,0.2,0.2,0.7,0.2,0.2,0.2,0.7,0.2,0.2]
             ,[0.9,0.2,0.2,0.7,0.2,0.2,0.2,0.7,0.0,0.0]
             ,[0.9,0.0,0.0,0.7,0.2,0.2,0.2,0.7,0.0,0.0]
             ,[0.9,0.0,0.4,0.0,0.4,0.0,0.4,0.0,0.4,0.0]
             ,[0.9,0.0,0.0,0.4,0.0,0.0,0.4,0.2,0.4,0.2]
             ,[0.9,0.0,0.2,0.7,0.0,0.2,0.0,0.7,0.0,0.0]
             ,[0.9,0.0,0.0,0.7,0.0,0.0,0.0,0.7,0.0,0.0]
             ,[0.9,0.7,0.7,0.0,0.0,0.2,0.2,0.2,0.0,0.0]
             ,[0.9,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]] 30
    -- tehai
    ,lseq [2.0,0.0,0.2,0.5,0.0,0.2,0.9
          ,1.5,0.0,0.2,0.5,0.0,0.2,0.9
          ,1.5,0.0,0.2,0.5,0.0,0.2] 3
    -- sam
    ,[5.0]]

act :: Transport m => m ()
act = do
  play (out 0 drone)
  let sy = synthdef "mridangam" (out 0 mridangam)
      a = concat (a_seq 'α')
  play (P.nbind1 (sy,100,[("amp",a),("dur",repeat (1/8))]))

main :: IO ()
main = withSC3 act
