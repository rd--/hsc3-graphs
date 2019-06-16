-- rm-octaver (av), courtesy miller puckette
-- http://crca.ucsd.edu/~msp/techniques/latest/book-html/node77.html

import Sound.SC3 {- hsc3 -}

defaultPitch :: UGen -> UGen
defaultPitch x = pitch x 440 60 4000 100 16 1 0.01 0.5 1 0

rm_octaver :: UGen -> UGen
rm_octaver i =
    let p = defaultPitch i
        [f,tr] = mceChannels p
    in lag3 tr 0.1 * sinOsc AR (f * 0.5) 0 * i + i

-- > audition (out 0 (soundIn 4))
main :: IO ()
main = audition (out 0 (rm_octaver (soundIn 4)))
