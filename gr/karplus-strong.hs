-- http://doc.gold.ac.uk/~ma503am/alex/vocable-source-released/ (am)

import Sound.OSC {- hosc -}
import Sound.SC3.ID {- hsc3 -}

-- x = delay, y = blend / gain
karplus_strong :: UGen
karplus_strong =
    let vf i s = let f = in' 5 KR i
                     a = in' 5 KR (i + 5)
                     b = in' 5 KR (i + 10)
                 in mix (resonz s f (b / f) * dbAmp a)
        x = mouseX KR 0 0.01 Linear 0.1
        y = mouseY KR 0.85 1 Linear 0.1
        ugenIf a b c = (a * b) + ((1 - a) * c)
        n = whiteNoise 'a' AR
        d = dust 'a' KR 4
        n0 = (n * 0.5) + 0.5
        probSwitch i prob = ugenIf (n0 >* prob) i (negate i)
        laggedDelay = lag x 0.01
        o = sinOsc AR 200 0
        a0 = decay d 0.025 * o
        a1 = localIn 1 AR + (a0 * (y - 0.25))
        a2 = delayN a1 0.01 laggedDelay
        a3 = delay1 a2
        a4 = (a2 + a3) * 0.5
        a5 = probSwitch a4 y
        a6 = vf (toggleFF d * 15) a5
        a7 = a6 * 1.5
    in mrg [localOut (a5 * 0.99),out 0 (mce2 a7 a7)]

act :: Transport m => m ()
act = do
  let aA = ("aA"
           ,[800,1150,2800,3500,4950]
           ,[0,-4 ,-20,-36,-60]
           ,[80,90, 120,130,140])
      aU = ("aU"
           ,[325,700,2530,3500,4950]
           ,[0,-12,-30,-40,-64]
           ,[50,60, 170,180,200])
      cs (_,c1,c2,c3) = c1 ++ c2 ++ c3
  send (c_setn [(0,cs aA),(15,cs aU)])
  play karplus_strong

main :: IO ()
main = withSC3 act
