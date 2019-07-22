-- scritto-m (rd)

import Control.Monad {- base -}

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Data.Speech.CS as CS {- hsc3-data -}

-- > scritto 1 3 0.01
-- > scritto 3 1 0.10
-- > scritto 2 1.5 0.15
scritto :: Int -> UGen -> UGen -> IO ()
scritto num_vc base_rt decay_tm =
  let s_msg n (_,_,f,a,b) = b_setn1 n 0 (f ++ a ++ b)
      s_alloc (s,b) = do _ <- async (b_alloc b 15 1)
                         sendMessage (s_msg b s)
      buf_at b n = bufRd 1 KR b (mce [n .. n + 4]) NoLoop NoInterpolation
      v_filter i f a b = resonz i f (b / f) * dbAmp a
      v_filter_b bi i = v_filter i (buf_at bi 0) (buf_at bi 5) (buf_at bi 10)
      mk_instr dcy rt bx = do
        n <- lfNoise2M KR rt
        let t = impulse AR (n * 9 + 9) 0
            i d = do n1 <- tRandM 0.02 0.06 t
                     n2 <- tiRandM 30 52 t
                     n3 <- tiRandM 16 32 t
                     let p = pulseDivider t d 0
                         b = blip AR (midiCPS n2) n3
                     return (decay2 p dcy n1 * b * 12)
            bi = linLin_b n 0 bx
            voice = mix . v_filter_b bi
        return . mce . map voice =<< mapM i [1,2]
  in withSC3 (do mapM_ s_alloc (zip CS.fdata_table [0 ..])
                 let n = constant CS.fdata_table_sz
                 v <- replicateM num_vc (mk_instr decay_tm base_rt n)
                 play (out 0 (sum v)))

main :: IO ()
main = scritto 1 3 0.01
