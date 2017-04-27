-- vla-adttn-sharc (rd)
{-# OPTIONS_GHC -F -pgmF hsc3-uparam #-}
-- http://www.timbre.ws/sharc/

import Data.List {- base -}
import Sound.Analysis.SHARC {- hsharc -}
import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Lang.Pattern.Plain as P {- hsc3-lang -}

type R = Double
type R3 = (R,R,R)

spectra :: [Instrument] -> String -> Int -> [R3]
spectra sh nm j =
  let Just i = find ((== nm) . instrument_id) sh
  in note_spectra (note_normalise (notes i !! j))

vla :: Transport m => FilePath -> m [R3]
vla fn = do
  Right sh <- liftIO (read_sharc fn)
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
        o = let dt' = lfNoise1 'α' KR 1 * dt + 1.0
            in fSinOsc AR (fr * (n + 1) * dt') ph
        e = linen (impulse KR 0 0)
                  (rise * rand 'β' 0.75 1.25)
                  ampl
                  (fall * rand 'γ' 0.75 1.25)
                  DoNothing
    in o * e

vla_plyr :: UGen -> UGen
vla_plyr n =
    let uparam = {amp = 0.1,freq = 129.897,rise = 0.1,fall = 0.5,loc = 0,dt = 0.001}
        s = sum (map (vla_partial freq rise fall dt) [0 .. n - 1])
        e = detectSilence s 0.001 0.2 RemoveSynth
    in mrg2 (pan2 s loc amp) e

plyr36 :: Synthdef
plyr36 = synthdef "plyr36" (out 0 (vla_plyr 36))

pattern :: P.Param
pattern =
    let to_cps = P.degree_to_cps' [0,2,4,5,7,9,11] 12
    in [("loc",P.white 'α' (-1) 1)
       ,("amp",P.white 'β' 0.05 0.1)
       ,("freq",to_cps (P.rand 'γ' [0,1,2,3,4,5,6,7,8]) (P.rand 'δ' [1,2]))
       ,("dt",P.white 'ε' 0.001 0.005)
       ,("rise",P.white 'ζ' 1 2)
       ,("fall",P.white 'η' 4 7)
       ,("dur",repeat 5)]

act :: Transport m => FilePath -> m ()
act fn = do
  v <- vla fn
  _ <- async (b_alloc_setn1 0 0 (vla_prep v))
  _ <- async (d_recv plyr36)
  performNRT (P.sbind1 (plyr36,pattern))

main :: IO ()
main = withSC3 (act "/home/rohan/data/sharc/sharc.xml")
