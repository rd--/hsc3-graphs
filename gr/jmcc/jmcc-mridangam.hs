-- mridangam (jmcc) #SPE3

import Sound.OSC {- hosc -}
import Sound.SC3 as SC3 {- hsc3 -}

import qualified Sound.SC3.Lang.Pattern.Bind as P {- hsc3-lang -}
import qualified Sound.SC3.Lang.Random.ID as R {- hsc3-lang -}

mri_mridangam :: UGen
mri_mridangam =
    let a = tr_control "amp" 1
        n = whiteNoise 'α' AR * 70
        e = decay2 a 0.002 0.1
    in distort (resonz (n * e) (midiCPS 60) 0.02 * 4) * 0.4

mri_drone :: UGen
mri_drone =
    let s1 = saw AR (midiCPS (mce2 60 60.04))
        s2 = saw AR (midiCPS (mce2 67 67.04))
    in lpf (s1 + s2) (midiCPS 108) * 0.007

lseq :: [a] -> Int -> [a]
lseq l n = concat (replicate n l)

lrand :: Enum e => e -> [[a]] -> Int -> [a]
lrand e l n = concat (R.nchoose e n l)

mri_a_seq :: (Num i,Fractional n) => ([n] -> i -> t) -> ([[n]] -> i -> t) -> [t]
mri_a_seq sq_f rnd_f =
    [sq_f [0.0] 10
    {- intro -}
    ,sq_f [0.9,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0] 2
    ,sq_f [0.9,0.0,0.0,0.2,0.0,0.0,0.0,0.2,0.0,0.0] 2
    ,sq_f [0.9,0.0,0.0,0.2,0.0,0.2,0.0,0.2,0.0,0.0] 2
    ,sq_f [0.9,0.0,0.0,0.2,0.0,0.0,0.0,0.2,0.0,0.2] 2
    {- solo -}
    ,rnd_f [[0.9,0.0,0.0,0.7,0.0,0.2,0.0,0.7,0.0,0.0]
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
    {- tehai -}
    ,sq_f [2.0,0.0,0.2,0.5,0.0,0.2,0.9
          ,1.5,0.0,0.2,0.5,0.0,0.2,0.9
          ,1.5,0.0,0.2,0.5,0.0,0.2] 3
    {- sam -}
    ,sq_f [5.0] 1]

mri_begin :: Transport m => m ()
mri_begin = do
  play (out 0 mri_drone)
  let sy = synthdef "mridangam" (out 0 mri_mridangam)
      a = concat (mri_a_seq lseq (lrand 'α'))
  nrt_play (P.nbind1 (sy,100,[("amp",a),("dur",repeat (1/8))]))

mri_run :: IO ()
mri_run = withSC3 mri_begin

main :: IO ()
main = mri_run
