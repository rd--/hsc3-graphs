tgrn (rd)
ghci -e main tgrn.lhs
C-cC-l C-cC-m

> import Sound.SC3.ID

> tgrn b =
>   let { trate = mouseY' KR 2 120 Exponential 0.1
>       ; dur = 1.2 / trate
>       ; clk = impulse AR trate 0
>       ; pos = mouseX' KR 0 (bufDur KR b) Linear 0.1
>       ; pan = whiteNoise 'α' KR * 0.6
>       ; n = roundTo (whiteNoise 'β' KR * 3) 1
>       ; rate = shiftLeft 1.2 n }
>   in tGrains 2 clk b rate pos dur pan 0.25 2

> main :: IO ()
> main =
>   let fn = "/home/rohan/data/audio/pf-c5.snd"
>   in withSC3 (\fd -> do { async fd (b_allocRead 10 fn 0 0)
>                         ; audition (out 0 (tgrn 10)) })
