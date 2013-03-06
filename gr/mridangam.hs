-- mridangam (jmcc)

import Sound.OSC {- hosc -}
import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Pattern.ID {- hsc3-lang -}

spe3_mridangam :: Synthdef
spe3_mridangam =
    let t_amp = tr_control "t_amp" 1
        n = whiteNoise 'α' AR * 70
        e = decay2 t_amp 0.002 0.1
        o = distort (resonz (n * e) (midiCPS 60) 0.02 * 4) * 0.4
    in synthdef "mridangam" (out 0 o)

spe3_drone :: Synthdef
spe3_drone =
    let s1 = saw AR (midiCPS (mce2 60 60.04))
        s2 = saw AR (midiCPS (mce2 67 67.04))
        o = lpf (s1 + s2) (midiCPS 108) * 0.007
    in synthdef "drone" (out 0 o)

p :: [P Double]
p =
    [pseq [0.0] 10
    -- intro
    ,pseq [0.9,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0] 2
    ,pseq [0.9,0.0,0.0,0.2,0.0,0.0,0.0,0.2,0.0,0.0] 2
    ,pseq [0.9,0.0,0.0,0.2,0.0,0.2,0.0,0.2,0.0,0.0] 2
    ,pseq [0.9,0.0,0.0,0.2,0.0,0.0,0.0,0.2,0.0,0.2] 2
    -- solo
    ,prand 'β' [pseq [0.9,0.0,0.0,0.7,0.0,0.2,0.0,0.7,0.0,0.0] 1
               ,pseq [0.9,0.2,0.0,0.7,0.0,0.2,0.0,0.7,0.0,0.0] 1
               ,pseq [0.9,0.0,0.0,0.7,0.0,0.2,0.0,0.7,0.0,0.2] 1
               ,pseq [0.9,0.0,0.0,0.7,0.2,0.2,0.0,0.7,0.0,0.0] 1
               ,pseq [0.9,0.0,0.0,0.7,0.0,0.2,0.2,0.7,0.2,0.0] 1
               ,pseq [0.9,0.2,0.2,0.7,0.2,0.2,0.2,0.7,0.2,0.2] 1
               ,pseq [0.9,0.2,0.2,0.7,0.2,0.2,0.2,0.7,0.0,0.0] 1
               ,pseq [0.9,0.0,0.0,0.7,0.2,0.2,0.2,0.7,0.0,0.0] 1
               ,pseq [0.9,0.0,0.4,0.0,0.4,0.0,0.4,0.0,0.4,0.0] 1
               ,pseq [0.9,0.0,0.0,0.4,0.0,0.0,0.4,0.2,0.4,0.2] 1
               ,pseq [0.9,0.0,0.2,0.7,0.0,0.2,0.0,0.7,0.0,0.0] 1
               ,pseq [0.9,0.0,0.0,0.7,0.0,0.0,0.0,0.7,0.0,0.0] 1
               ,pseq [0.9,0.7,0.7,0.0,0.0,0.2,0.2,0.2,0.0,0.0] 1
               ,pseq [0.9,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0] 1] 30
    -- tehai
    ,pseq [2.0,0.0,0.2,0.5,0.0,0.2,0.9
          ,1.5,0.0,0.2,0.5,0.0,0.2,0.9
          ,1.5,0.0,0.2,0.5,0.0,0.2] 3
    -- sam
    ,pseq [5] 1]

act :: Transport m => m ()
act = do
  play spe3_drone
  _ <- async (d_recv spe3_mridangam)
  let p' = pmono_d spe3_mridangam 100 [("t_amp",pseq p 1),("dur",1/8)]
  play p'

main :: IO ()
main = withSC3 act
