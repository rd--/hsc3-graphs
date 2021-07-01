-- select
let n = 3/2
    a = mce [sinOsc ar 440 0, saw ar 440, pulse ar 440 0.1]
in select (lfSaw kr 1 0 * n + n) a * 0.1
