-- mridangam (jmcc) #SPE3

import Sound.OSC {- hosc -}
import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Pattern {- hsc3-lang -}

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

p :: Fractional n => [P n]
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
  play (out 0 drone)
  let i = Instr_Def (synthdef "mridangam" (out 0 mridangam)) False
  play (pmono [(K_instr,pinstr' i)
              ,(K_id,100)
              ,(K_amp,pseq p 1)
              ,(K_dur,1/12)])

main :: IO ()
main = withSC3 act
