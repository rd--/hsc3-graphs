-- http://sccode.org/1-S (nv)

import Sound.SC3 {- hsc3 -}

-- | fb, as given in the feedback quark, but requires number of
-- channels to be given directly.
fb :: ID z => Int -> z -> (UGen -> UGen) -> UGen
fb nc z f =
    let nfr = controlDur * sampleRate
        buf = clearLocalBuf z (constant nc) nfr
        ph = phasor AR 0 1 0 nfr 0
        inp = bufRd nc AR buf ph Loop LinearInterpolation
        sig = f inp
        bwr = bufWr buf ph Loop sig
    in mrg2 sig bwr

up :: UGen
up =
    let x = bpf (uclone 'α' 2 (pinkNoise 'β' AR) * 0.2) 100 0.2 * line KR 1 0 1 DoNothing
    in fb 2 'γ' (\z -> freqShift (z + x) 5 0)

down :: UGen
down =
    let x = bpf (uclone 'δ' 2 (pinkNoise 'ε' AR) * 0.2) 8000 0.2 * line KR 1 0 1 DoNothing
    in fb 2 'ζ' (\z -> freqShift (z + x) (-4) 0)

main :: IO ()
main = audition up
