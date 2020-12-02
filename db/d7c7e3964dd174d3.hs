-- streson ; http://www.csounds.com/manual/html/streson.html
let z = lfSaw AR (mce2 220 180) 0 * 0.2
    dt = recip (linExp (lfCub KR 0.1 (0.5 * pi)) (-1) 1 280 377)
in X.streson z dt 0.9 * 0.1
