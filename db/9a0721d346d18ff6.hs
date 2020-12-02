-- varSaw ; compare with lfPulse at AR
let f = lfPulse KR 3 0 0.3 * 200 + 200
in mce [varSaw AR f 0 0.2
       ,lfPulse AR f 0 0.2] * 0.1
