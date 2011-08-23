eggcrate (rd)

> import Sound.SC3
> import qualified Sound.SC3.Monadic as M
> import qualified Sound.SC3.ID as I

> eggcrate_mu :: IO UGen
> eggcrate_mu =
>   let { cosu = cos . (* pi)
>       ; sinu = sin . (* pi)
>       ; eggcrate u v = cosu u * sinu v
>       ; p = mce [64, 72, 96, 128, 256, 6400, 7200, 8400, 9600] }
>   in do { [x, y] <- sequence (replicate 2 (M.brownNoise KR))
>         ; t <- M.dust KR 2.4
>         ; [f0, f1] <- sequence (replicate 2 (M.tChoose t p))
>         ; let { f = linLin (eggcrate x y) (-1) 1 f0 f1
>               ; a = linLin x (-1) 1 0 0.1 }
>           in return (pan2 (mix (sinOsc AR f 0)) y a) }

audition . out 0 =<< eggcrate_mu

> eggcrate_iu :: UGen
> eggcrate_iu =
>   let { cosu = cos . (* pi)
>       ; sinu = sin . (* pi)
>       ; eggcrate u v = cosu u * sinu v
>       ; p = mce [64, 72, 96, 128, 256, 6400, 7200, 8400, 9600]
>       ; [x,y] = map (\z -> I.brownNoise z KR) "ab"
>       ; t = I.dust 'c' KR 2.4
>       ; [f0,f1] = map (\z -> I.tChoose z t p) "de"
>       ; f = linLin (eggcrate x y) (-1) 1 f0 f1
>       ; a = linLin x (-1) 1 0 0.1 }
>  in pan2 (mix (sinOsc AR f 0)) y a

audition (out 0 eggcrate_iu)

> main :: IO ()
> main = audition . out 0 =<< eggcrate_mu

{ var eggcrate = { arg u, v
                 ; (u * pi).cos * (v * pi).sin }
; var p = [64, 72, 96, 128, 256, 6400, 7200, 8400, 9600]
; var x = BrownNoise.kr()
; var y = BrownNoise.kr()
; var t = Dust.kr(2.4)
; var f0 = TChoose.kr(t, p)
; var f1 = TChoose.kr(t, p)
; var f = LinLin.kr(eggcrate.value(x, y), -1, 1, f0, f1)
; var a = LinLin.kr(x, -1, 1, 0, 0.1)
; Out.ar(0, Pan2.ar(Mix.ar(SinOsc.ar(f, 0)), y, a)) }.play
