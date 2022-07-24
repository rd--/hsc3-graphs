-- https://twitter.com/redFrik/status/456384156159574016 (f0)
let a = [1/3, 1/12, 1/4, 1/1, 1/6, 1/2]
    s = Lag3 (SinOsc a 0) (Abs (SinOsc (Pow 2.67 a) 0)) * 99
    f = ((SinOsc (1 / a / 9) a > 0) * 20 + 99) / a
in Splay (SinOsc (HPF (Ringz s f 1) 440) 0) 1 1 0 True * 0.25
