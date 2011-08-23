tr-out (rd)

> import Sound.SC3.Monadic

> main :: IO ()
> main =
>   let node n = do
>         { t <- dust KR 1.6
>         ; r1 <- tRand 0 6 t
>         ; r2 <- tRand 0 6 t
>         ; r3 <- tRand 0 6 t
>         ; let { f = midiCPS (bufRdN 1 KR 0 r1 NoLoop)
>               ; p = bufRdN 1 KR 1 r2 NoLoop
>               ; a = bufRdN 1 KR 2 r3 NoLoop }
>                     in return ( pan2 (sinOsc AR f 0) p a
>                               , sendTrig t n (f / 660) ) }
>       act fd = do
>         { _ <- async fd (b_alloc 0 6 1)
>         ; _ <- send fd (b_setn1 0 0 [60, 62, 64, 65, 67, 69])
>         ; _ <- async fd (b_alloc 1 6 1)
>         ; send fd (b_setn1 1 0 [-1, -0.5, 0, 0.25, 0.75, 1.0])
>         ; _ <- async fd (b_alloc 2 6 1)
>         ; send fd (b_setn1 2 0 [0.01, 0.05, 0.1, 0.15, 0.25, 0.35])
>         ; ns <- mapM node [1..4]
>         ; let o = sum (map fst ns)
>           in play fd (out 0 (mrg (o : map snd ns))) >>
>              return () }
>   in withSC3 (\fd -> act fd)
