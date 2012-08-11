-- rm-octaver (andrea valle, miller puckette)

import Sound.SC3 {- hsc3 -}

defaultPitch :: UGen -> UGen
defaultPitch x = pitch x 440 60 4000 100 16 1 0.01 0.5 1

rm_octaver :: UGen -> UGen
rm_octaver i =
    let p = defaultPitch i
        f = mceChannel 0 p
    in sinOsc AR (f * 0.5) 0 * i + i

main :: IO ()
main = audition (out 0 (rm_octaver (soundIn 4)))
