-- lag ; frequency plain at left and smoothed at right
let f = sinOsc kr 0.05 0.0 `in_range` (220,440)
in sinOsc ar (mce2 f (lag f 1)) 0 * 0.1
