-- pebble beach (np)
-- http://sccode.org/1-u
-- requires 'scsynth -u 57110 -m 32768'

import Sound.SC3.ID

exprange :: UGen -> UGen -> UGen -> UGen
exprange l r i = linExp i (-1) 1 l r

bg_f :: UGen -> UGen
bg_f k =
    let sc = 0.4 + (k * 0.07)
        fr = range 3100 4900 (lag (lfNoise0 'a' KR 21.8) 0.7) * sc
        am = range 0 1 (lag (lfNoise1 'a' KR 5.227) 5.374)
    in bpf (pinkNoise 'a' AR * 0.4) fr 0.1 * am

fg_f :: UGen -> UGen -> UGen
fg_f df tf =
    let d = dust 'a' AR (df * rand 'a' 0.8 1.2) * 50
	l = exprange 800 900 (sinOsc KR 2.2 0)
	r = exprange 2600 2900 (sinOsc KR 5.228 0)
	z = resonz d (tRand 'a' l r d) (tRand 'a' 0.03 0.08 d)
        t = lagUD (range 2 0.5 (saw KR tf)) 0.6 2.8
        o = z * t
    in o + combL o 0.8 (rand 'a' 0.2 0.8) (iChoose 'a' (mce2 (-4) 4))

pebble_beach' :: ID a => a -> UGen
pebble_beach' j =
    let bg' = let am = range 0 1 (lag (lfNoise0 'a' KR 34) 1.4)
              in brownNoise 'a' AR * 0.06 * am
        bg = bg' + sum (uprotect j (map bg_f [0..19])) * 0.6
        tf = range 0.122 0.24 (sinOsc KR 0.17 0)
        df = exprange 1 700 (lfTri KR tf 0) * exprange 1 0.2 (lfTri KR tf 0)
        fg = mix (uclone j 50 (fg_f df tf)) * 0.2
    in (bg + fg) * line KR 0 1 1.2 DoNothing

pebble_beach :: UGen
pebble_beach = mce2 (pebble_beach' 'a') (pebble_beach' 'b')

main :: IO ()
main = audition (out 0 pebble_beach)
