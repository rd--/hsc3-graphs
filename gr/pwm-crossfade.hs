-- pwm crossfade (jl)
-- http://sccode.org/1-L

import Sound.SC3.ID {- hsc3 -}

urangeM :: UGen -> UGen -> UGen
urangeM u = let [u0,u1] = mceChannels u in urange u0 u1

-- > Sound.SC3.UGen.Dot.draw pwm_crossfade
pwm_crossfade :: UGen
pwm_crossfade =
    let n = mce [400,500,450,376,600]
        d = 1/20
        f = demand (impulse KR d (mce2 0 0.5)) 0 (dseq 'a' dinf n)
        f_ = urangeM f (lfPulse KR 8 0 (range 0 1 (lfTri KR d 1)))
    in lpf (saw AR (max 376 f_ * mce2 1 0.99) * 0.5) 8000

main :: IO ()
main = audition (out 0 pwm_crossfade)