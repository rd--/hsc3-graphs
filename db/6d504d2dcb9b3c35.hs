-- tw 0011 (f0) ; https://twitter.com/redFrik/status/23182604046
let s o i = sinOsc ar ((mce2 (constant i) (constant i + 0.0001)) ** 2 * f o (i - 1)) (f o (i - 1) * 0.0001) * f o (i - 1)
    f o i = if i > 0 then s o i else o
in f 60 6 / 60
