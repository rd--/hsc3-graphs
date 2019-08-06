-- scritto (rd, 2006-10-01)

import Control.Monad {- base -}
import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Data.Speech.CS as CS {- hsc3-data -}

scritto_i :: UGen -> UGen
scritto_i bx =
    let buf_at b n = bufRd 1 KR b (mce [n .. n + 4]) NoLoop NoInterpolation
        v_filter i f a b = resonz i f (b / f) * dbAmp a
        n0 = lfNoise2 'α' KR 3
        v_filter_b i =
            let bi = linLin_b n0 0 bx
                b = buf_at bi in v_filter i (b 0) (b 5) (b 10)
        t = impulse AR (n0 * 9 + 9) 0
        ble (e,d) =
            let n1 = tRand e 0.02 0.06 t
                n2 = tiRand e 30 52 t
                n3 = tiRand e 16 32 t
                p = pulseDivider t d 0
                b = blip AR (midiCPS n2) n3
            in (decay2 p 0.01 n1 * b * 12)
        voice = mix . v_filter_b
    in out 0 (mce (map (voice . ble) (zip ['β','γ'] [1,2])))

s_alloc :: Transport m => (CS.Fdata Double,Int) -> m ()
s_alloc (s,b) = do
  let s_msg n (_,_,fr,am,bw) = b_setn1 n 0 (fr ++ am ++ bw)
  _ <- async (b_alloc b 15 1)
  sendMessage (s_msg b s)

s_init :: Transport m => m ()
s_init = mapM_ s_alloc (zip CS.fdata_table [0..])

act :: Transport m => Bool -> m ()
act i = do
  when i s_init
  let n = constant (CS.fdata_table_sz)
  play (scritto_i n)

main :: IO ()
main = withSC3 (act True)

{-
withSC3 (act False)
-}

-- * M


-- > scrittoM 1 3 0.01
-- > scrittoM 3 1 0.10
-- > scrittoM 2 1.5 0.15
scrittoM :: Int -> UGen -> UGen -> IO ()
scrittoM num_vc base_rt decay_tm =
  let buf_at b n = bufRd 1 KR b (mce [n .. n + 4]) NoLoop NoInterpolation
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

mainM :: IO ()
mainM = scrittoM 1 3 0.01
