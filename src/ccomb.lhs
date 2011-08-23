ccomb (rd)

> import Sound.SC3.Monadic

> ccomb :: IO UGen
> ccomb =
>   let { rng l r i = linLin i (-1) 1 l r
>       ; lwr = 48
>       ; flwr = midiCPS lwr
>       ; spart t = do { n <- fmap (rng lwr 72.0) (lfNoise2 KR 0.1)
>                      ; e <- fmap (decay2 t 0.01) (tRand 0.05 0.75 t)
>                      ; x <- fmap (* e) (whiteNoise AR)
>                      ; m <- lfNoise2 KR 0.1
>                      ; let { f = lag (midiCPS n) 0.25
>                            ; m' = rng 1 8 m }
>                        in return (combC x (recip flwr) (recip f) m') } }
>   in do { t <- dust KR (mce2 0.75 0.35)
>         ; return . (* 0.1) . sum =<< sequence (replicate 12 (spart t)) }

> main :: IO ()
> main = audition . out 0 =<< ccomb

{ var lwr = 48
; var flwr = lwr.midicps
; var spart = { arg t
              ; { var n = LFNoise2.kr(0.1).range(lwr, 72.0)
                ; var e = Decay2.kr(t, 0.01, TRand.kr(0.05, 0.75, t))
                ; var x = WhiteNoise.ar() * e
                ; var m = LFNoise2.kr(0.1)
                ; var f = Lag.kr(n.midicps, 0.25)
                ; CombC.ar(x, flwr.reciprocal, f.reciprocal, m.range(1, 8)) } }
; var t = Dust.kr([0.75, 0.35])
; Out.ar(0, Mix.fill(12, spart.value(t)) * 0.1) }.play
