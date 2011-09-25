-- scritto (rd)

import Control.Monad
import Sound.OpenSoundControl
import Sound.SC3.ID
import qualified Sound.SC3.Lang.Data.Vowel as V

scritto_i :: UGen -> UGen
scritto_i bx =
    let buf_at b n = bufRd 1 KR b (mce [n .. n + 4]) NoLoop NoInterpolation
        v_filter i f a b = resonz i f (b / f) * dbAmp a
        n0 = lfNoise2 'a' KR 3
        v_filter_b i =
            let bi = linLin n0 (-1) 1 0 bx
                b = buf_at bi in v_filter i (b 0) (b 5) (b 10)
        t = impulse AR (n0 * 9 + 9) 0
        ble (e,d) =
            let n1 = tRand e 0.02 0.06 t
                n2 = tIRand e 30 52 t
                n3 = tIRand e 16 32 t
                p = pulseDivider t d 0
                b = blip AR (midiCPS n2) n3
            in (decay2 p 0.01 n1 * b * 12)
        voice = mix . v_filter_b
    in out 0 (mce (map voice (map ble (zip ['a','b'] [1,2]))))

s_alloc :: Transport t => t -> (V.Fdata Double,Int) -> IO ()
s_alloc fd (s,b) = do
  let s_msg n (_,_,fr,am,bw) = b_setn1 n 0 (fr ++ am ++ bw)
  _ <- async fd (b_alloc b 15 1)
  send fd (s_msg b s)

s_init :: Transport t => t -> IO ()
s_init fd = mapM_ (s_alloc fd) (zip V.fdata_table [0..])

act :: Transport t => Bool -> t -> IO ()
act i fd = do
  when i (s_init fd)
  let n = constant (length V.fdata_table)
  play fd (scritto_i n)

main :: IO ()
main = withSC3 (act True)

{-
withSC3 (act False)
-}
