-- mrg2 ; the leftmost node may be an mce node
let l = sinOsc AR (mce2 300 400) 0 * 0.1
    r = out 1 (sinOsc AR 900 0 * 0.1)
in mrg2 l r
