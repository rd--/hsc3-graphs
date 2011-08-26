-- pwm crossfade (jl)
-- http://sccode.org/1-L

import Sound.SC3.ID

urangeM :: UGen -> UGen -> UGen
urangeM u = let [u0,u1] = mceChannels u in urange u0 u1

pwm_crossfade :: UGen
pwm_crossfade =
    let n = mce [400,500,450,376,600]
        d = 1/20
        f = demand (impulse KR d (mce2 0 0.5)) 0 (dseq 'a' dinf n)
        f_ = urangeM f (lfPulse KR 8 0 (range 0 1 (lfTri KR d 1)))
    in lpf (saw AR (max 376 f_ * mce2 1 0.99) * 0.5) 8000

main :: IO ()
main = audition (out 0 pwm_crossfade)

{-
Sound.SC3.UGen.Dot.draw pwm_crossfade
-}

{-
{var n = [400,500,450,376,600]
;var d = 1/20
;var f = Demand.kr(Impulse.kr(d,[0,0.5]),0,Dseq(n,inf))
;var f_ = LFPulse.kr(8,0,LFTri.kr(d,1).range(0,1)).range(*f)
;LPF.ar(Saw.ar(f_.max(376) * [1,0.99],0.5),8000);}.play
-}
