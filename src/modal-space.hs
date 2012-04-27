-- modal space (jmcc)

import Sound.OpenSoundControl
import Sound.SC3.ID

ms :: UGen -> UGen -> UGen
ms n r =
    let x = mouseX' KR 0 15 Linear 0.1
        k = degreeToKey 0 x 12
        o = sinOsc AR (midiCPS (r + k + n * 0.04)) 0 * 0.1
        t = lfPulse AR (midiCPS (mce2 48 55)) 0.15 0.5
        f = midiCPS (sinOsc KR 0.1 0 * 10 + r)
        d = rlpf t f 0.1 * 0.1
        m = o + d
    in combN m 0.31 0.31 2 + m

modal_space :: UGen
modal_space =
    let n = uclone 'a' 2 (lfNoise1 'a' KR 3)
    in (ms n 48 + ms n 72) * 0.25

run :: Transport t => t -> IO ()
run fd = do
  let p = [0,2,3.2,5,7,9,10]
  _ <- async fd (b_alloc_setn1 0 0 p)
  play fd (out 0 modal_space)

main :: IO ()
main = withSC3 run
