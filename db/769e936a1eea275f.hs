-- sumSqr
let o1 = fSinOsc AR 800 0
    o2 = fSinOsc AR (xLine KR 200 500 5 DoNothing) 0
in sumSqr o1 o2 * 0.125