fm-kltr (rd)

> import Sound.OpenSoundControl
> import Sound.SC3.Monadic
> import System.Random

> main :: IO ()
> main =
>   let { rrand l r = getStdRandom (randomR (l, r))
>       ; gr =
>             do { r1 <- rand 0.975 1.025
>                ; r2 <- rand 0.5 1.5
>                ; r3 <- rand 0.975 1.025
>                ; r4 <- rand 0.75 1.25
>                ; let { o = control IR "out" 0
>                   {- ; t = control KR "trig" 0 {- unused -} -}
>                      ; a = control KR "amp" 0.1
>                      ; d = control KR "dur" 0.1
>                      ; f = control KR "freq" 400.0
>                      ; i = control KR "index" 40.0
>                      ; p = control KR "pan" 0.0
>                      ; f2 = control KR "freq2" 600
>                      ; ep = envPerc 0.01 d
>                      ; e = envGen AR 1 a 0 1 RemoveSynth ep
>                      ; so = sinOsc AR (xLine KR f (f * r1) d DoNothing) 0
>                      ; xl = xLine KR f2 (f2 * r3) d DoNothing
>                      ; m = so * line KR i (f * r2) d DoNothing + xl
>                      ; l = line KR p (p * r4) d DoNothing }
>                  in return (out o (pan2 (sinOsc AR m 0) l e)) }
>       ; fm fd f ff a d i =
>           do { r1 <- rrand (-1) 1
>              ; r2 <- rrand (-1) 1
>              ; send fd (s_new "fm" (-1) AddToTail 1
>                               [("freq", midiCPS f)
>                               ,("freq2", midiCPS ff + r1)
>                               ,("amp", a)
>                               ,("dur", d)
>                               ,("index", i)
>                               ,("pan", r2)]) }
>       ; nd fd =
>           do { ff <- rrand 48 96
>              ; a <- rrand 0.1 0.4
>              ; d <- rrand 1.2 7.2
>              ; i <- rrand 240 1480
>              ; t <- rrand 0.15 1.25
>              ; fm fd 53 ff a d i
>              ; pauseThread t } }
>   in withSC3 (\fd -> do { u <- gr
>                         ; _ <- async fd (d_recv (synthdef "fm" u))
>                         ; sequence_ (replicate 32 (nd fd)) })
