-- mrg2 ; there is a leftmost rule, so that mrg nodes need not be terminal
let l = sinOsc AR 300 0 * 0.1
    r = out 1 (sinOsc AR 900 0 * 0.1)
in mrg2 l r
