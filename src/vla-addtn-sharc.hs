-- vla-adttn-sharc (rd)

import Data.List
import Sound.Analysis.SHARC
import Sound.OpenSoundControl
import Sound.SC3.ID
import Sound.SC3.Lang.Pattern.ID

type R = Double
type R3 = (R,R,R)

spectra :: [Instrument] -> String -> Int -> [R3]
spectra sh nm j =
  let Just i = find ((== nm) . instrument_id) sh
  in note_spectra (note_normalise (notes i !! j))

vla :: FilePath -> IO [R3]
vla fn = do
  Right sh <- read_sharc fn
  return (spectra sh "viola_vibrato" 0)

unp :: R3 -> [R]
unp (_,i,j) = [i,j]

vla_prep :: [R3] -> [R]
vla_prep = concatMap unp

-- fr = freq,dt = detune
vla_partial :: UGen -> UGen -> UGen -> UGen -> UGen -> UGen
vla_partial fr rise fall dt n =
    let m = n * 2
        ampl = bufRdN 1 KR 0 m NoLoop
        ph = bufRdN 1 KR 0 (m + 1) NoLoop
        o = let dt' = lfNoise1 'a' KR 1 * dt + 1.0
            in fSinOsc AR (fr * (n + 1) * dt') ph
        e = linen (impulse KR 0 0)
                  (rise * rand 'a' 0.75 1.25)
                  ampl
                  (fall * rand 'b' 0.75 1.25)
                  DoNothing
    in o * e

vla_plyr :: UGen -> UGen
vla_plyr n =
    let a = control KR "ampl" 0.1
        f = control KR "freq" 129.897
        rs = control KR "rise" 0.1
        fa = control KR "fall" 0.5
        l = control KR "loc" 0.0
        dt = control KR "dt" 0.001
        s = sum (map (vla_partial f rs fa dt) [0 .. n - 1])
        e = detectSilence s 0.001 0.2 RemoveSynth
    in mrg2 (pan2 s l a) e

plyr36 :: Synthdef
plyr36 = synthdef "plyr36" (out 0 (vla_plyr 36))

pattern :: [(String,P Double)]
pattern =
    [("loc",pwhite 'a' (-1) 1 inf)
    ,("ampl",pwhite 'b' 0.05 0.1 inf)
    ,("degree",prand 'c' [0,1,2,3,4,5,6,7,8] inf)
    ,("octave",prand 'd' [2,3] inf)
    ,("dt",pwhite 'e' 0.001 0.005 inf)
    ,("rise",pwhite 'f' 1 2 inf)
    ,("fall",pwhite 'g' 4 7 inf)
    ,("dur",prand 'h' [3,5] inf)]

act :: Transport t => FilePath -> t -> IO ()
act fn fd = do
  v <- vla fn
  _ <- async fd (b_alloc_setn1 0 0 (vla_prep v))
  play fd (plyr36,pbind pattern)

main :: IO ()
main = withSC3 (act "/home/rohan/data/sharc/sharc.xml")