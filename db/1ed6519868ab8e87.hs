-- varSaw ; compare with lfPulse at ar
let f = lfPulse kr 3 0 0.3 * 200 + 200
in mce [varSaw ar f 0 0.2
       ,lfPulse ar f 0 0.2] * 0.1
