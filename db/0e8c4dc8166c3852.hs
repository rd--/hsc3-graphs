-- replaceOut ; send signal to a bus, overwrite existing signal
--            ; mrg nodes are ordered right to left, so below b replaces c and then a is summed
let a = sinOsc AR (mce [120, 121]) 0 * 0.1
    b = sinOsc AR (mce [330, 331]) 0 * 0.1
    c = sinOsc AR (mce [880, 881]) 0 * 0.1
in mrg [out 0 a, replaceOut 0 b, out 0 c]
