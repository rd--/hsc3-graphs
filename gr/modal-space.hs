-- modal space (jmcc)

import Sound.OSC {- hosc -}
import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.UGen.Protect

ms :: UGen -> UGen -> UGen
ms n r =
    let x = mouseX KR 0 15 Linear 0.1
        k = degreeToKey 0 x 12
        o = sinOsc AR (midiCPS (r + k + n * 0.04)) 0 * 0.1
        t = lfPulse AR (midiCPS (mce2 48 55)) 0.15 0.5
        f = midiCPS (sinOsc KR 0.1 0 * 10 + r)
        d = rlpf t f 0.1 * 0.1
        m = o + d
    in combN m 0.31 0.31 2 + m

modal_space :: UGen
modal_space =
    let n = uclone 'α' 2 (lfNoise1 'β' KR 3)
    in (ms n 48 + ms n 72) * 0.25

run :: Transport m => m ()
run = do
  let p = [0,2,3.2,5,7,9,10]
  _ <- async (b_alloc_setn1 0 0 p)
  play (out 0 modal_space)

main :: IO ()
main = withSC3 run
