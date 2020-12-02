-- mrg2 ; the implementation is not thorough
let l = sinOsc AR (mce2 300 400) 0 * 0.1
    r = out 1 (sinOsc AR 900 0 * 0.1)
in out 0 (mrg2 l r + mrg2 l r)
