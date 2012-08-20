-- scritto (rd)

import Control.Monad
import Sound.OSC {- hosc -}
import Sound.SC3.ID {- hsc3 -}
import qualified Sound.SC3.Lang.Data.Vowel as V {- hsc3-lang -}

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
    in out 0 (mce (map (voice . ble) (zip "ab" [1,2])))

s_alloc :: Transport m => (V.Fdata Double,Int) -> m ()
s_alloc (s,b) = do
  let s_msg n (_,_,fr,am,bw) = b_setn1 n 0 (fr ++ am ++ bw)
  _ <- async (b_alloc b 15 1)
  send (s_msg b s)

s_init :: Transport m => m ()
s_init = mapM_ s_alloc (zip V.fdata_table [0..])

act :: Transport m => Bool -> m ()
act i = do
  when i s_init
  let n = constant (length (V.fdata_table::[V.Fdata Int]))
  play (scritto_i n)

main :: IO ()
main = withSC3 (act True)

{-
withSC3 (act False)
-}
