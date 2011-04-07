sprinkler (jmcc)

> import Sound.SC3.ID

> sprinkler =
>   let { n = whiteNoise 'α' AR
>       ; f = lfPulse KR 0.09 0 0.16 * 10 + 7
>       ; t = lfPulse KR f 0 0.25 * 0.1 }
>   in bpz2 (n * t)

> main = audition (out 0 sprinkler)

{ var f = LFPulse.kr(0.09, 0, 0.16, 10, 7)
; var t = LFPulse.kr(f, 0, 0.25, 0.1)
; Out.ar(0, BPZ2.ar(WhiteNoise.ar * t)) }.play
