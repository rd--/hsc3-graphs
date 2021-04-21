-- select
let n = 3/2
    a = mce [sinOsc AR 440 0, saw AR 440, pulse AR 440 0.1]
in select (lfSaw KR 1 0 * n + n) a * 0.1
