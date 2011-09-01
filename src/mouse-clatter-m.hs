-- mouse clatter (rd)

import Sound.OpenSoundControl
import Sound.SC3.Monadic

mouse_clatter :: UId m => m UGen
mouse_clatter = do
  let x = mouseX' KR 100 12000 Linear 0.1
      y = mouseY' KR 0.01 0.15 Linear 0.1
  n1 <- lfNoise0 KR (mce [3,3.25])
  let t = impulse KR (n1 * 16 + 18) 0
  n2 <- tRand 0.005 y t
  n3 <- whiteNoise AR
  n4 <- tRand 10 x t
  n5 <- tRand 0 1 t
  n6 <- tExpRand 0.15 1 t
  o <- let e = decay2 t 0.01 n2
       in return (bpf (n3 * e) n4 n5)
  n7 <- pv_RandComb (fft' 10 o) n6 t
  return (o * 0.05 + ifft' n7)

run :: Transport t => t -> IO ()
run fd = do
  _ <- async fd (b_alloc 10 2048 1)
  play fd . out 0 =<< mouse_clatter

main :: IO ()
main = withSC3 run

{-
s.sendMsg('b_alloc', 10, 2048, 1);

{var x = MouseX.kr(100,12000,'linear',0.1)
;var y = MouseY.kr(0.01,0.15,'linear',0.1)
;var n1 = LFNoise0.kr([3,3.25])
;var t = Impulse.kr((n1 * 16) + 18,0)
;var n2 = TRand.kr(0.005,y,t)
;var n3 = WhiteNoise.ar()
;var n4 = TRand.kr(10,x,t)
;var n5 = TRand.kr(0,1,t)
;var n6 = TExpRand.kr(0.15,1,t)
;var o = {var e = Decay2.kr(t,0.01,n2)
         ;BPF.ar(n3 * e,n4,n5)}
;var n7 = PV_RandComb(FFT(10,o),n6,t)
;var s = (o * 0.05) + IFFT(n7)
;Out.ar(0,s)}.play

(let* ((x (MouseX KR 100 12000 0 0.1))
       (y (MouseY KR 0.01 0.15 0 0.1))
       (n1 (LFNoise0 KR (mce2 3 3.25)))
       (t (Impulse KR (MulAdd n1 16 18) 0))
       (n2 (TRand 0.005 y t))
       (n3 (WhiteNoise AR))
       (n4 (TRand 10 x t))
       (n5 (TRand 0.0 1.0 t))
       (n6 (TExpRand 0.15 1.0 t))
       (e (Decay2 t 0.01 n2))
       (o (BPF (Mul n3 e) n4 n5))
       (n7 (PV_RandComb (FFT* 10 o) n6 t))
       (s (Add (Mul o 0.05) (IFFT* n7))))
  (with-sc3
   (lambda (fd)
     (async fd (/b_alloc 10 2048 1))
     (play fd (Out 0 s)))))
-}
