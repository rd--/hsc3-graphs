-- klink (rd)

import Sound.SC3.ID

klink :: UGen
klink =
  let n1 = lfNoise0 'a' KR (mce2 0.5 1.5)
      o = sinOsc KR n1 0
      a = abs (slope o) * mce2 2 3
      t = impulse AR a 0
      i = decay2 t 0.01 0.1
      x = mouseX' KR 960 3620 Exponential 0.2
      y = mouseY' KR 0.5 2.0 Linear 0.2
      n2 = tRand 'a' x 3940 t
      n3 = tRand 'a' 0.005 0.275 t
  in ringz i n2 (n3 * y)

main :: IO ()
main = audition (out 0 klink)

{-
{var n1 = LFNoise0.kr([0.5,1.5])
;var o = SinOsc.kr(n1,0)
;var a = Slope.kr(o).abs * [2,3]
;var t = Impulse.ar(a,0)
;var i = Decay2.ar(t,0.01,0.1)
;var x = MouseX.kr(960,3620,'exponential',0.2)
;var y = MouseY.kr(0.5,2.0,'linear',0.2)
;var n2 = TRand.ar(x,3940,t)
;var n3 = TRand.ar(0.005,0.275,t)
;Out.ar(0,Ringz.ar(i,n2,n3 * y))}.play
-}
